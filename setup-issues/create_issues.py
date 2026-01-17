#!/usr/bin/env python3
"""
Script pour créer automatiquement toutes les issues GitHub depuis ISSUES.md
Date: 17 janvier 2026
"""

import subprocess
import re
import time

def run_gh_command(args):
    """Exécute une commande gh et retourne le résultat"""
    try:
        result = subprocess.run(
            ['gh'] + args,
            capture_output=True,
            text=True,
            check=True
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        print(f"❌ Erreur: {e.stderr}")
        return None

def parse_issues_from_md():
    """Parse le fichier ISSUES.md et extrait toutes les issues"""
    with open('ISSUES.md', 'r', encoding='utf-8') as f:
        content = f.read()
    
    issues = []
    
    # Pattern pour trouver les milestones
    milestone_pattern = r'## Milestone (\d+) - (.+?)\n\n\*\*Durée\*\*.*?\n\*\*Objectif\*\* : (.+?)\n'
    
    # Pattern pour trouver les issues
    issue_pattern = r'### Issue #(\d+) - (.+?)\n\*\*Labels\*\* : `(.+?)`.*?\n\*\*Priorité\*\* : (.+?)\n.*?\n\*\*Description :\*\*\n(.+?)(?=\n\*\*Critères d\'acceptation)'
    
    # Trouver tous les milestones
    milestones_matches = re.finditer(milestone_pattern, content, re.DOTALL)
    milestone_sections = {}
    
    for match in milestones_matches:
        milestone_num = int(match.group(1))
        milestone_title = match.group(2)
        milestone_sections[milestone_num] = milestone_title
    
    # Extraire les issues de chaque section de milestone
    sections = re.split(r'## Milestone \d+ - ', content)[1:]
    
    for idx, section in enumerate(sections, 1):
        milestone_num = idx
        
        # Trouver toutes les issues dans cette section
        issue_matches = re.finditer(
            r'### Issue #\d+ - (.+?)\n\*\*Labels\*\* : `(.+?)`.*?\n\*\*Priorité\*\* : (.+?)\n.*?\n\*\*Description :\*\*\n(.+?)\n\n\*\*Critères d\'acceptation :\*\*\n((?:- \[[ x]\] .+?\n)+)',
            section,
            re.DOTALL
        )
        
        for match in issue_matches:
            title = match.group(1).strip()
            labels = match.group(2).strip()
            priority = match.group(3).strip()
            description = match.group(4).strip()
            criteria = match.group(5).strip()
            
            # Construire le body complet
            body = f"{description}\n\n**Critères d'acceptation:**\n{criteria}"
            
            # Nettoyer le body
            body = body.replace('\n\n\n', '\n\n')
            
            issues.append({
                'milestone': milestone_num,
                'title': title,
                'labels': labels,
                'priority': priority,
                'body': body
            })
    
    return issues

def get_milestone_title(milestone_num):
    """Retourne le titre du milestone selon son numéro"""
    milestones = {
        1: "Milestone 1 - Administration et Gestion des utilisateurs",
        2: "Milestone 2 - Structure scolaire",
        3: "Milestone 3 - Gestion des notes - Enseignants",
        4: "Milestone 4 - Consultation notes - Eleves et Parents",
        5: "Milestone 5 - Gestion des presences",
        6: "Milestone 6 - Dashboards et navigation",
        7: "Milestone 7 - Permissions et securite",
        8: "Milestone 8 - Polish et finitions"
    }
    return milestones.get(milestone_num, str(milestone_num))

def create_issue(issue):
    """Crée une issue sur GitHub"""
    title = issue['title']
    body = issue['body']
    labels = issue['labels']
    milestone = get_milestone_title(issue['milestone'])
    
    print(f"  Création: {title[:60]}...")
    
    # Préparer la commande
    args = [
        'issue', 'create',
        '--title', title,
        '--body', body,
        '--label', labels,
        '--milestone', milestone
    ]
    
    result = run_gh_command(args)
    
    if result:
        # Extraire le numéro d'issue de l'URL
        issue_num = result.split('/')[-1] if result else '?'
        print(f"    ✓ Issue #{issue_num} créée")
        return True
    else:
        print(f"    ✗ Échec")
        return False

def main():
    print("🚀 Création automatique des issues GitHub pour NexSchool")
    print("=" * 60)
    print()
    
    # Vérifier que gh est installé et authentifié
    print("🔍 Vérification de GitHub CLI...")
    result = run_gh_command(['auth', 'status'])
    if not result:
        print("❌ GitHub CLI n'est pas configuré. Exécute: gh auth login")
        return
    print("✓ GitHub CLI configuré\n")
    
    # Parser les issues
    print("📖 Lecture de ISSUES.md...")
    try:
        issues = parse_issues_from_md()
        print(f"✓ {len(issues)} issues trouvées\n")
    except Exception as e:
        print(f"❌ Erreur lors de la lecture: {e}")
        return
    
    if not issues:
        print("❌ Aucune issue trouvée dans ISSUES.md")
        return
    
    # Afficher un résumé
    print("📊 Résumé:")
    milestone_counts = {}
    for issue in issues:
        m = issue['milestone']
        milestone_counts[m] = milestone_counts.get(m, 0) + 1
    
    for m in sorted(milestone_counts.keys()):
        print(f"  Milestone {m}: {milestone_counts[m]} issues")
    print()
    
    # Demander confirmation
    response = input("Créer toutes ces issues sur GitHub? (o/n): ")
    if response.lower() != 'o':
        print("Annulé.")
        return
    
    print("\n📝 Création des issues...\n")
    
    # Créer les issues par milestone
    created = 0
    failed = 0
    
    current_milestone = 0
    for issue in issues:
        if issue['milestone'] != current_milestone:
            current_milestone = issue['milestone']
            print(f"\n📌 Milestone {current_milestone}")
        
        if create_issue(issue):
            created += 1
        else:
            failed += 1
        
        # Petit délai pour éviter le rate limiting
        time.sleep(0.5)
    
    # Résumé final
    print("\n" + "=" * 60)
    print("✅ Terminé!")
    print(f"   Issues créées: {created}")
    if failed > 0:
        print(f"   Échecs: {failed}")
    print("\n🌐 Voir sur GitHub:")
    print("   gh repo view --web")

if __name__ == '__main__':
    main()
