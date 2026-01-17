# Guide pour créer les issues GitHub pour NexSchool

## Étapes réalisées ✅

1. ✅ GitHub CLI installé et authentifié
2. ✅ 8 Milestones créés sur GitHub

## Vérifier les milestones créés

```powershell
gh api repos/:owner/:repo/milestones | ConvertFrom-Json | Select-Object number, title
```

## Pour voir les milestones sur GitHub

```powershell
gh repo view --web
```
Puis cliquer sur "Issues" → "Milestones"

## Créer les issues

### Option 1: Manuellement via l'interface GitHub (Recommandé)
1. Aller sur https://github.com/2MJ-DEV/NexSchool/issues
2. Cliquer sur "New issue"
3. Copier-coller le contenu depuis ISSUES.md
4. Ajouter les labels appropriés
5. Assigner au milestone correspondant

### Option 2: Via GitHub CLI (une par une)

Pour créer une issue:

```powershell
gh issue create --title "TITRE" --body "DESCRIPTION" --label "label1,label2" --milestone NUMERO
```

Exemple pour la première issue:

```powershell
gh issue create `
  --title "Creer la page de liste des utilisateurs" `
  --body "Creer une page permettant a l'administrateur de voir tous les utilisateurs de la plateforme." `
  --label "enhancement,admin,frontend,backend" `
  --milestone 1
```

### Option 3: Script automatisé (si tu veux créer toutes les 52 issues)

Je peux créer un script Python qui va:
1. Lire ISSUES.md
2. Parser toutes les issues
3. Les créer automatiquement via l'API GitHub

Veux-tu que je crée ce script Python?

## Labels à créer sur GitHub d'abord

Avant de créer les issues, tu peux vouloir créer ces labels:

```powershell
# Labels de type
gh label create "enhancement" --color "0E8A16" --description "Nouvelle fonctionnalite"
gh label create "bug" --color "D73A4A" --description "Correction de bug"
gh label create "documentation" --color "0075CA" --description "Documentation"
gh label create "testing" --color "F9D0C4" --description "Tests"

# Labels de rôle
gh label create "admin" --color "5319E7" --description "Fonctionnalite admin"
gh label create "teacher" --color "D876E3" --description "Fonctionnalite enseignant"
gh label create "student" --color "0052CC" --description "Fonctionnalite eleve"
gh label create "parent" --color "006B75" --description "Fonctionnalite parent"

# Labels technique
gh label create "frontend" --color "BFD4F2" --description "Frontend React/TypeScript"
gh label create "backend" --color "C5DEF5" --description "Backend Laravel/PHP"
gh label create "database" --color "FEF2C0" --description "Base de donnees"
gh label create "security" --color "D93F0B" --description "Securite"
gh label create "performance" --color "FBCA04" --description "Performance"
gh label create "api" --color "0E8A16" --description "API REST"
gh label create "ui" --color "E99695" --description "Interface utilisateur"

# Labels de priorité
gh label create "priority: critical" --color "B60205" --description "Priorite critique"
gh label create "priority: high" --color "D93F0B" --description "Priorite haute"
gh label create "priority: medium" --color "FBCA04" --description "Priorite moyenne"
gh label create "priority: low" --color "0E8A16" --description "Priorite basse"

# Labels spéciaux
gh label create "good first issue" --color "7057FF" --description "Bon pour debuter"
gh label create "help wanted" --color "008672" --description "Aide recherchee"
```

## Prochaines étapes recommandées

1. Créer les labels (commandes ci-dessus)
2. Aller sur GitHub et créer les issues manuellement en copiant depuis ISSUES.md
3. OU me demander de créer un script Python pour automatiser tout ça

## Commandes utiles

```powershell
# Lister les milestones
gh api repos/:owner/:repo/milestones

# Lister les issues
gh issue list

# Lister les labels
gh label list

# Voir le repo sur GitHub
gh repo view --web
```

## 🎯 Résumé

- ✅ 8 Milestones créés et configurés avec dates d'échéance
- ⏳ 52 Issues à créer (manuellement ou avec script)
- 📋 Voir ISSUES.md pour le contenu détaillé de chaque issue
