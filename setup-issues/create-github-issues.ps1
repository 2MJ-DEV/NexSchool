# Script PowerShell pour créer les milestones et issues GitHub pour NexSchool
# Date: 17 janvier 2026

Write-Host "🚀 Création des Milestones et Issues pour NexSchool" -ForegroundColor Cyan
Write-Host ""

# Vérifier si on est dans un repo Git avec un remote GitHub
$repo = gh repo view --json nameWithOwner -q .nameWithOwner 2>&1
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Erreur: Ce n'est pas un repo GitHub ou pas de remote configuré" -ForegroundColor Red
    Write-Host "Voulez-vous créer un nouveau repo GitHub? (o/n)" -ForegroundColor Yellow
    $response = Read-Host
    if ($response -eq 'o') {
        Write-Host "Création du repo GitHub..." -ForegroundColor Green
        gh repo create NexSchool --public --source=. --remote=origin
        $repo = gh repo view --json nameWithOwner -q .nameWithOwner
    } else {
        exit 1
    }
}

Write-Host "📦 Repository: $repo" -ForegroundColor Green
Write-Host ""

# Création des milestones
Write-Host "📊 Création des 8 Milestones..." -ForegroundColor Cyan

$milestones = @(
    @{title="Milestone 1 - Administration & Gestion des utilisateurs"; due="2026-01-26"; description="Permettre à l'administrateur de gérer tous les utilisateurs de la plateforme"},
    @{title="Milestone 2 - Structure scolaire"; due="2026-02-02"; description="Mettre en place la structure de base (années, classes, matières)"},
    @{title="Milestone 3 - Gestion des notes - Enseignants"; due="2026-02-09"; description="Permettre aux enseignants de créer des évaluations et saisir les notes"},
    @{title="Milestone 4 - Consultation des notes - Élèves & Parents"; due="2026-02-09"; description="Permettre aux élèves et parents de consulter les notes et moyennes"},
    @{title="Milestone 5 - Gestion des présences"; due="2026-02-16"; description="Système de gestion des présences/absences"},
    @{title="Milestone 6 - Dashboards et navigation"; due="2026-02-23"; description="Créer des dashboards personnalisés et améliorer la navigation"},
    @{title="Milestone 7 - Permissions et sécurité"; due="2026-03-02"; description="Sécuriser l'application et implémenter les permissions"},
    @{title="Milestone 8 - Polish et finitions"; due="2026-03-02"; description="Finaliser, tester et documenter le MVP"}
)

$milestoneNumbers = @{}
foreach ($ms in $milestones) {
    Write-Host "  Creating: $($ms.title)..." -ForegroundColor Yellow
    $result = gh api repos/:owner/:repo/milestones -f title="$($ms.title)" -f description="$($ms.description)" -f due_on="$($ms.due)T23:59:59Z" -f state="open" | ConvertFrom-Json
    $milestoneNumbers[$ms.title] = $result.number
    Write-Host "    ✓ Milestone #$($result.number) créé" -ForegroundColor Green
}

Write-Host ""
Write-Host "✅ Tous les milestones ont été créés!" -ForegroundColor Green
Write-Host ""

# Création des issues par milestone
Write-Host "📝 Création des Issues..." -ForegroundColor Cyan
Write-Host ""

# Milestone 1 - Issues #1 à #9
Write-Host "Milestone 1: Administration & Gestion des utilisateurs" -ForegroundColor Magenta

$issues_m1 = @(
    @{title="Créer la page de liste des utilisateurs"; body="Créer une page permettant à l'administrateur de voir tous les utilisateurs de la plateforme.`n`n**Critères d'acceptation:**`n- [ ] Table affichant : nom complet, email, rôle(s), statut`n- [ ] Pagination (20 utilisateurs par page)`n- [ ] Filtre par rôle et statut`n- [ ] Barre de recherche`n- [ ] Bouton créer utilisateur`n- [ ] Actions: Modifier, Supprimer`n- [ ] Design responsive"; labels="enhancement,admin,frontend,backend,priority: high"},
    @{title="Créer le formulaire de création d'utilisateur"; body="Implémenter le formulaire permettant de créer un nouvel utilisateur.`n`n**Critères d'acceptation:**`n- [ ] Formulaire avec prénom, nom, email, rôles`n- [ ] Sélection multiple des rôles`n- [ ] Génération automatique mot de passe`n- [ ] Validation côté client et serveur`n- [ ] Messages d'erreur clairs"; labels="enhancement,admin,frontend,backend,priority: high"},
    @{title="Créer le formulaire de modification d'utilisateur"; body="Permettre la modification des informations d'un utilisateur existant.`n`n**Critères d'acceptation:**`n- [ ] Formulaire pré-rempli`n- [ ] Modification: prénom, nom, email, rôles`n- [ ] Activation/désactivation du compte`n- [ ] Validation des données"; labels="enhancement,admin,frontend,backend,priority: high"},
    @{title="Implémenter la suppression d'utilisateur"; body="Permettre la suppression (soft delete) d'un utilisateur avec confirmation.`n`n**Critères d'acceptation:**`n- [ ] Modal de confirmation`n- [ ] Soft delete (deleted_at)`n- [ ] Message de succès`n- [ ] Impossibilité de se supprimer soi-même"; labels="enhancement,admin,backend,priority: medium"},
    @{title="Créer la page de gestion des relations parent-élève"; body="Interface pour lier des parents à leurs enfants (élèves).`n`n**Critères d'acceptation:**`n- [ ] Liste des relations existantes`n- [ ] Formulaire d'ajout de relation`n- [ ] Types de relation: Parent, Tuteur, Autre`n- [ ] Un élève peut avoir plusieurs parents"; labels="enhancement,admin,frontend,backend,priority: high"},
    @{title="Créer les seeders pour données de test"; body="Créer des seeders pour générer des données de test réalistes.`n`n**Critères d'acceptation:**`n- [ ] 1 admin, 5 enseignants, 30 élèves, 20 parents`n- [ ] Attribution automatique de rôles`n- [ ] Relations parent-élève cohérentes`n- [ ] Données en français"; labels="enhancement,backend,testing,priority: medium"},
    @{title="Ajouter les middleware de vérification des rôles admin"; body="Sécuriser toutes les routes d'administration avec un middleware.`n`n**Critères d'acceptation:**`n- [ ] Middleware EnsureUserIsAdmin`n- [ ] Vérification rôle admin ou superadmin`n- [ ] Application sur toutes les routes /admin/*"; labels="enhancement,backend,security,priority: critical"},
    @{title="Créer les tests pour la gestion des utilisateurs"; body="Tests pour les fonctionnalités CRUD des utilisateurs.`n`n**Critères d'acceptation:**`n- [ ] Test: Liste accessible par admin`n- [ ] Test: Création avec validation`n- [ ] Test: Modification et suppression`n- [ ] Test: Non-admin bloqué`n- [ ] Couverture > 80%"; labels="testing,backend,priority: high"},
    @{title="Documenter le module administration"; body="Documentation du module administration.`n`n**Critères d'acceptation:**`n- [ ] Documentation API`n- [ ] Guide utilisateur admin`n- [ ] Captures d'écran`n- [ ] Exemples de code"; labels="documentation,priority: low"}
)

foreach ($issue in $issues_m1) {
    gh issue create --title $issue.title --body $issue.body --label $issue.labels --milestone $milestoneNumbers["Milestone 1 - Administration & Gestion des utilisateurs"]
    Write-Host "  ✓ Issue créée: $($issue.title)" -ForegroundColor Green
}

Write-Host ""
Write-Host "Milestone 2: Structure scolaire" -ForegroundColor Magenta

$issues_m2 = @(
    @{title="Créer le modèle et migration pour les années scolaires"; body="Modèle et table pour gérer les années scolaires.`n`n**Critères d'acceptation:**`n- [ ] Table school_years avec tous les champs`n- [ ] Modèle SchoolYear avec relations`n- [ ] Une seule année active`n- [ ] Méthode scopeActive()"; labels="enhancement,backend,database,priority: critical"},
    @{title="Créer l'interface de configuration de l'année scolaire"; body="Interface pour créer et gérer les années scolaires.`n`n**Critères d'acceptation:**`n- [ ] Formulaire: nom, dates, périodes`n- [ ] Définition trimestres/semestres`n- [ ] Activation/désactivation`n- [ ] Liste des années"; labels="enhancement,admin,frontend,backend,priority: high"},
    @{title="Créer le modèle et migration pour les classes"; body="Modèle et table pour les classes scolaires.`n`n**Critères d'acceptation:**`n- [ ] Table classes avec tous les champs`n- [ ] Relations avec SchoolYear et Users`n- [ ] Unique constraint (name, school_year_id)"; labels="enhancement,backend,database,priority: critical"},
    @{title="Créer l'interface de gestion des classes"; body="CRUD complet pour les classes.`n`n**Critères d'acceptation:**`n- [ ] Liste des classes`n- [ ] Création, modification, suppression`n- [ ] Nombre d'élèves par classe`n- [ ] Filtre par niveau"; labels="enhancement,admin,frontend,backend,priority: high"},
    @{title="Créer l'interface d'attribution des élèves aux classes"; body="Interface pour assigner des élèves à une classe.`n`n**Critères d'acceptation:**`n- [ ] Vue détaillée d'une classe`n- [ ] Ajout/retrait d'élèves`n- [ ] Sélection multiple`n- [ ] Vérification capacité"; labels="enhancement,admin,frontend,backend,priority: high"},
    @{title="Créer le modèle et migration pour les matières"; body="Modèle et table pour les matières/cours.`n`n**Critères d'acceptation:**`n- [ ] Table subjects avec code unique`n- [ ] Coefficient par défaut`n- [ ] Relations"; labels="enhancement,backend,database,priority: critical"},
    @{title="Créer l'interface de gestion des matières"; body="CRUD simple pour les matières.`n`n**Critères d'acceptation:**`n- [ ] Liste, création, modification, suppression`n- [ ] Affichage nombre d'attributions"; labels="enhancement,admin,frontend,backend,priority: high"},
    @{title="Créer le système d'attribution matière-classe-enseignant"; body="Système pour assigner un enseignant à une matière pour une classe.`n`n**Critères d'acceptation:**`n- [ ] Table class_subject_teacher`n- [ ] Interface d'attribution`n- [ ] Vue par classe et par enseignant`n- [ ] Validation pas de doublon"; labels="enhancement,admin,frontend,backend,priority: critical"}
)

foreach ($issue in $issues_m2) {
    gh issue create --title $issue.title --body $issue.body --label $issue.labels --milestone $milestoneNumbers["Milestone 2 - Structure scolaire"]
    Write-Host "  ✓ Issue créée: $($issue.title)" -ForegroundColor Green
}

Write-Host ""
Write-Host "Milestone 3: Gestion des notes - Enseignants" -ForegroundColor Magenta

$issues_m3 = @(
    @{title="Créer le modèle et migration pour les évaluations"; body="Modèle et table pour les évaluations/contrôles.`n`n**Critères d'acceptation:**`n- [ ] Table evaluations complète`n- [ ] Types: devoir, controle, examen, oral`n- [ ] Statuts: brouillon, publiée`n- [ ] Relations"; labels="enhancement,backend,database,priority: critical"},
    @{title="Créer l'interface de création d'évaluation"; body="Formulaire pour créer une évaluation.`n`n**Critères d'acceptation:**`n- [ ] Formulaire complet`n- [ ] Sélection classe et matière`n- [ ] Brouillon ou publier`n- [ ] Validation"; labels="enhancement,teacher,frontend,backend,priority: high"},
    @{title="Créer la liste des évaluations pour enseignants"; body="Page listant toutes les évaluations de l'enseignant.`n`n**Critères d'acceptation:**`n- [ ] Liste avec filtres`n- [ ] Tri par date`n- [ ] Actions: Modifier, Saisir notes, Supprimer"; labels="enhancement,teacher,frontend,backend,priority: high"},
    @{title="Créer le modèle et migration pour les notes"; body="Modèle et table pour stocker les notes.`n`n**Critères d'acceptation:**`n- [ ] Table grades`n- [ ] Unique constraint`n- [ ] Gestion des absents"; labels="enhancement,backend,database,priority: critical"},
    @{title="Créer l'interface de saisie des notes"; body="Interface optimisée pour saisir rapidement les notes.`n`n**Critères d'acceptation:**`n- [ ] Table avec élèves`n- [ ] Inputs pour notes`n- [ ] Checkbox absent`n- [ ] Sauvegarde automatique`n- [ ] Statistiques classe"; labels="enhancement,teacher,frontend,backend,priority: critical"},
    @{title="Implémenter le système de calcul des moyennes"; body="Service pour calculer automatiquement les moyennes.`n`n**Critères d'acceptation:**`n- [ ] Service GradeCalculationService`n- [ ] Moyenne par matière avec coefficients`n- [ ] Moyenne générale`n- [ ] Calcul par période`n- [ ] Cache"; labels="enhancement,backend,priority: critical"},
    @{title="Créer les tests pour le module notes"; body="Tests pour les fonctionnalités de gestion des notes.`n`n**Critères d'acceptation:**`n- [ ] Tests création évaluation`n- [ ] Tests saisie notes`n- [ ] Tests calcul moyennes`n- [ ] Tests permissions"; labels="testing,backend,priority: high"}
)

foreach ($issue in $issues_m3) {
    gh issue create --title $issue.title --body $issue.body --label $issue.labels --milestone $milestoneNumbers["Milestone 3 - Gestion des notes - Enseignants"]
    Write-Host "  ✓ Issue créée: $($issue.title)" -ForegroundColor Green
}

Write-Host ""
Write-Host "Milestone 4: Consultation des notes - Élèves & Parents" -ForegroundColor Magenta

$issues_m4 = @(
    @{title="Créer le dashboard élève avec aperçu des notes"; body="Dashboard personnalisé pour l'élève.`n`n**Critères d'acceptation:**`n- [ ] Moyenne générale`n- [ ] Moyennes par matière`n- [ ] Dernières notes`n- [ ] Graphique d'évolution"; labels="enhancement,student,frontend,backend,priority: high"},
    @{title="Créer la page de détail des notes par matière (élève)"; body="Page détaillée des notes pour une matière.`n`n**Critères d'acceptation:**`n- [ ] Liste évaluations avec notes`n- [ ] Moyenne de la matière`n- [ ] Graphique d'évolution"; labels="enhancement,student,frontend,backend,priority: high"},
    @{title="Créer le dashboard parent avec sélecteur d'enfant"; body="Dashboard pour les parents.`n`n**Critères d'acceptation:**`n- [ ] Dropdown sélection enfant`n- [ ] Vue identique à élève`n- [ ] Alertes"; labels="enhancement,parent,frontend,backend,priority: high"},
    @{title="Créer la page de consultation des notes pour parents"; body="Pages de consultation similaires à l'espace élève.`n`n**Critères d'acceptation:**`n- [ ] Vérification parent-enfant`n- [ ] Navigation entre matières"; labels="enhancement,parent,frontend,backend,priority: high"},
    @{title="Créer l'API pour récupérer les moyennes"; body="Endpoints API pour les moyennes.`n`n**Critères d'acceptation:**`n- [ ] GET /api/students/{id}/averages`n- [ ] Format JSON`n- [ ] Cache`n- [ ] Permissions"; labels="enhancement,backend,api,priority: high"},
    @{title="Créer les tests pour la consultation des notes"; body="Tests pour la consultation.`n`n**Critères d'acceptation:**`n- [ ] Tests accès élève`n- [ ] Tests accès parent`n- [ ] Tests permissions"; labels="testing,backend,priority: medium"}
)

foreach ($issue in $issues_m4) {
    gh issue create --title $issue.title --body $issue.body --label $issue.labels --milestone $milestoneNumbers["Milestone 4 - Consultation des notes - Élèves & Parents"]
    Write-Host "  ✓ Issue créée: $($issue.title)" -ForegroundColor Green
}

Write-Host ""
Write-Host "Milestone 5: Gestion des présences" -ForegroundColor Magenta

$issues_m5 = @(
    @{title="Créer le modèle et migration pour les présences"; body="Modèle et table pour les présences.`n`n**Critères d'acceptation:**`n- [ ] Table attendances`n- [ ] Status: present, absent, late`n- [ ] Relations"; labels="enhancement,backend,database,priority: critical"},
    @{title="Créer l'interface d'appel pour enseignants"; body="Interface rapide pour faire l'appel.`n`n**Critères d'acceptation:**`n- [ ] Sélection classe/matière`n- [ ] Liste élèves avec statuts`n- [ ] Sauvegarde rapide`n- [ ] Mobile-friendly"; labels="enhancement,teacher,frontend,backend,priority: critical"},
    @{title="Créer l'historique des appels pour enseignants"; body="Page listant les appels effectués.`n`n**Critères d'acceptation:**`n- [ ] Liste avec filtres`n- [ ] Modification possible"; labels="enhancement,teacher,frontend,backend,priority: medium"},
    @{title="Créer la page de consultation des absences pour élèves"; body="Page pour voir les absences/retards.`n`n**Critères d'acceptation:**`n- [ ] Liste absences/retards`n- [ ] Statistiques`n- [ ] Code couleur"; labels="enhancement,student,frontend,backend,priority: high"},
    @{title="Créer la page de consultation des absences pour parents"; body="Page similaire pour les parents.`n`n**Critères d'acceptation:**`n- [ ] Sélection enfant`n- [ ] Vue identique élève"; labels="enhancement,parent,frontend,backend,priority: high"},
    @{title="Créer le rapport des absences pour administration"; body="Interface admin pour suivre les absences.`n`n**Critères d'acceptation:**`n- [ ] Taux de présence global`n- [ ] Filtres multiples`n- [ ] Export CSV`n- [ ] Graphiques"; labels="enhancement,admin,frontend,backend,priority: medium"}
)

foreach ($issue in $issues_m5) {
    gh issue create --title $issue.title --body $issue.body --label $issue.labels --milestone $milestoneNumbers["Milestone 5 - Gestion des présences"]
    Write-Host "  ✓ Issue créée: $($issue.title)" -ForegroundColor Green
}

Write-Host ""
Write-Host "Milestone 6: Dashboards et navigation" -ForegroundColor Magenta

$issues_m6 = @(
    @{title="Améliorer le dashboard administrateur"; body="Dashboard complet avec statistiques.`n`n**Critères d'acceptation:**`n- [ ] Cartes de stats`n- [ ] Graphiques évolution`n- [ ] Alertes importantes`n- [ ] Liens rapides"; labels="enhancement,admin,frontend,backend,priority: high"},
    @{title="Créer le dashboard enseignant complet"; body="Dashboard pour les enseignants.`n`n**Critères d'acceptation:**`n- [ ] Section aujourd'hui`n- [ ] Mes classes`n- [ ] À faire`n- [ ] Accès rapides"; labels="enhancement,teacher,frontend,backend,priority: high"},
    @{title="Finaliser les dashboards élève et parent"; body="Amélioration des dashboards existants.`n`n**Critères d'acceptation:**`n- [ ] Design cohérent`n- [ ] Graphiques`n- [ ] Performance"; labels="enhancement,student,parent,frontend,priority: high"},
    @{title="Créer le système de navigation adaptatif par rôle"; body="Menu qui s'adapte selon le rôle.`n`n**Critères d'acceptation:**`n- [ ] Menu par rôle`n- [ ] Responsive`n- [ ] Active states`n- [ ] Icônes"; labels="enhancement,frontend,ui,priority: critical"},
    @{title="Créer la page de paramètres utilisateur"; body="Page centralisée pour les paramètres.`n`n**Critères d'acceptation:**`n- [ ] Onglets: Profil, Sécurité, Apparence`n- [ ] Design cohérent"; labels="enhancement,frontend,backend,priority: medium"},
    @{title="Optimiser les performances des dashboards"; body="Optimisation des requêtes et cache.`n`n**Critères d'acceptation:**`n- [ ] Query caching`n- [ ] Eager loading`n- [ ] Temps < 1s`n- [ ] Lazy loading"; labels="enhancement,backend,performance,priority: medium"}
)

foreach ($issue in $issues_m6) {
    gh issue create --title $issue.title --body $issue.body --label $issue.labels --milestone $milestoneNumbers["Milestone 6 - Dashboards et navigation"]
    Write-Host "  ✓ Issue créée: $($issue.title)" -ForegroundColor Green
}

Write-Host ""
Write-Host "Milestone 7: Permissions et sécurité" -ForegroundColor Magenta

$issues_m7 = @(
    @{title="Créer le système de policies Laravel"; body="Implémenter les policies pour chaque modèle.`n`n**Critères d'acceptation:**`n- [ ] Policies pour tous les modèles`n- [ ] Utilisation dans controllers`n- [ ] Tests"; labels="enhancement,backend,security,priority: critical"},
    @{title="Créer les middlewares de vérification des rôles"; body="Middlewares pour restreindre l'accès.`n`n**Critères d'acceptation:**`n- [ ] Middlewares par rôle`n- [ ] Messages appropriés"; labels="enhancement,backend,security,priority: critical"},
    @{title="Implémenter la validation côté serveur"; body="Form Requests pour tous les formulaires.`n`n**Critères d'acceptation:**`n- [ ] Form Request pour chaque formulaire`n- [ ] Messages en français`n- [ ] Sanitization"; labels="enhancement,backend,security,priority: critical"},
    @{title="Sécuriser les APIs et routes"; body="Audit et sécurisation des routes.`n`n**Critères d'acceptation:**`n- [ ] Auth middleware partout`n- [ ] Rate limiting`n- [ ] Logs`n- [ ] Headers sécurité"; labels="enhancement,backend,security,priority: critical"},
    @{title="Créer les tests de sécurité et permissions"; body="Suite de tests complète.`n`n**Critères d'acceptation:**`n- [ ] Tests accès non auth`n- [ ] Tests permissions`n- [ ] Tests validation`n- [ ] Couverture > 90%"; labels="testing,backend,security,priority: critical"}
)

foreach ($issue in $issues_m7) {
    gh issue create --title $issue.title --body $issue.body --label $issue.labels --milestone $milestoneNumbers["Milestone 7 - Permissions et sécurité"]
    Write-Host "  ✓ Issue créée: $($issue.title)" -ForegroundColor Green
}

Write-Host ""
Write-Host "Milestone 8: Polish et finitions" -ForegroundColor Magenta

$issues_m8 = @(
    @{title="Implémenter les toast notifications et feedbacks"; body="Système de notifications cohérent.`n`n**Critères d'acceptation:**`n- [ ] Toast pour succès/erreur`n- [ ] Animations`n- [ ] Loading states"; labels="enhancement,frontend,ui,priority: high"},
    @{title="Optimiser le responsive design"; body="Toutes les pages utilisables sur mobile.`n`n**Critères d'acceptation:**`n- [ ] Tests multi-devices`n- [ ] Navigation mobile`n- [ ] Touch-friendly"; labels="enhancement,frontend,ui,priority: high"},
    @{title="Créer la suite de tests E2E"; body="Tests end-to-end des workflows principaux.`n`n**Critères d'acceptation:**`n- [ ] Tests workflows complets`n- [ ] Playwright configuré`n- [ ] Tests CI"; labels="testing,e2e,priority: medium"},
    @{title="Créer la documentation utilisateur"; body="Documentation complète pour utilisateurs.`n`n**Critères d'acceptation:**`n- [ ] Guides par rôle`n- [ ] FAQ`n- [ ] Screenshots"; labels="documentation,priority: high"},
    @{title="Préparer le déploiement et documentation technique"; body="Doc technique et préparation déploiement.`n`n**Critères d'acceptation:**`n- [ ] README à jour`n- [ ] Guide déploiement`n- [ ] Scripts`n- [ ] Checklist prod"; labels="documentation,devops,priority: critical"}
)

foreach ($issue in $issues_m8) {
    gh issue create --title $issue.title --body $issue.body --label $issue.labels --milestone $milestoneNumbers["Milestone 8 - Polish et finitions"]
    Write-Host "  ✓ Issue créée: $($issue.title)" -ForegroundColor Green
}

Write-Host ""
Write-Host "✅ Terminé!" -ForegroundColor Green
Write-Host ""
Write-Host "📊 Résumé:" -ForegroundColor Cyan
Write-Host "  - 8 Milestones créés" -ForegroundColor Yellow
Write-Host "  - 52 Issues créées" -ForegroundColor Yellow
Write-Host ""
Write-Host "🌐 Voir sur GitHub:" -ForegroundColor Cyan
Write-Host "  gh repo view --web" -ForegroundColor White
