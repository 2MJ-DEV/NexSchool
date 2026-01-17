# NexSchool - Issues & Milestones

Ce fichier contient toutes les issues organisées par milestones (modules) pour le développement du MVP de NexSchool.

---

## Vue d'ensemble des Milestones

| Milestone | Description | Issues | Durée | Statut |
|-----------|-------------|--------|-------|--------|
| [Milestone 1](#milestone-1---administration--gestion-des-utilisateurs) | Administration - Gestion des utilisateurs | 9 | Semaine 1 | 🔴 À faire |
| [Milestone 2](#milestone-2---structure-scolaire) | Structure scolaire (Années, Classes, Matières) | 8 | Semaine 2 | 🔴 À faire |
| [Milestone 3](#milestone-3---gestion-des-notes---enseignants) | Gestion des notes - Enseignants | 7 | Semaine 3 | 🔴 À faire |
| [Milestone 4](#milestone-4---consultation-des-notes---élèves--parents) | Consultation des notes - Élèves & Parents | 6 | Semaine 3 | 🔴 À faire |
| [Milestone 5](#milestone-5---gestion-des-présences) | Gestion des présences | 6 | Semaine 4 | 🔴 À faire |
| [Milestone 6](#milestone-6---dashboards-et-navigation) | Dashboards et navigation | 6 | Semaine 5 | 🔴 À faire |
| [Milestone 7](#milestone-7---permissions-et-sécurité) | Permissions et sécurité | 5 | Semaine 6 | 🔴 À faire |
| [Milestone 8](#milestone-8---polish-et-finitions) | Polish et finitions | 5 | Semaine 6 | 🔴 À faire |

**Total : 52 issues**

---

## Milestone 1 - Administration & Gestion des utilisateurs

**Durée** : Semaine 1 (20-26 janvier 2026)  
**Objectif** : Permettre à l'administrateur de gérer tous les utilisateurs de la plateforme

### Issue #1 - Créer la page de liste des utilisateurs
**Labels** : `enhancement`, `admin`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 1 jour

**Description :**
Créer une page permettant à l'administrateur de voir tous les utilisateurs de la plateforme.

**Critères d'acceptation :**
- [ ] Table affichant : nom complet, email, rôle(s), statut (actif/inactif)
- [ ] Pagination (20 utilisateurs par page)
- [ ] Filtre par rôle (dropdown multi-select)
- [ ] Filtre par statut (actif/inactif)
- [ ] Barre de recherche par nom ou email
- [ ] Bouton "Créer un utilisateur"
- [ ] Actions sur chaque ligne : Modifier, Supprimer
- [ ] Design responsive (mobile, tablette, desktop)

**Tâches techniques :**
- Backend : Controller `UserController@index` avec filtres et pagination
- Frontend : Composant `UsersList.tsx` avec table + filtres
- Route : `GET /admin/users`

---

### Issue #2 - Créer le formulaire de création d'utilisateur
**Labels** : `enhancement`, `admin`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 1 jour

**Description :**
Implémenter le formulaire permettant de créer un nouvel utilisateur.

**Critères d'acceptation :**
- [ ] Formulaire avec champs : prénom, nom, email, rôle(s)
- [ ] Sélection multiple des rôles (checkbox ou multi-select)
- [ ] Génération automatique d'un mot de passe temporaire
- [ ] Validation côté client et serveur
- [ ] Messages d'erreur clairs
- [ ] Confirmation de création avec le mot de passe généré
- [ ] Redirection vers la liste après création

**Tâches techniques :**
- Backend : `UserController@store`, Request validation
- Frontend : Composant `CreateUserForm.tsx`
- Route : `POST /admin/users`
- Génération de mot de passe aléatoire sécurisé

---

### Issue #3 - Créer le formulaire de modification d'utilisateur
**Labels** : `enhancement`, `admin`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 0.5 jour

**Description :**
Permettre la modification des informations d'un utilisateur existant.

**Critères d'acceptation :**
- [ ] Formulaire pré-rempli avec les données existantes
- [ ] Modification : prénom, nom, email, rôles
- [ ] Bouton pour activer/désactiver le compte
- [ ] Validation des données
- [ ] Message de succès après modification
- [ ] Redirection vers la liste

**Tâches techniques :**
- Backend : `UserController@update`
- Frontend : Composant `EditUserForm.tsx`
- Routes : `GET /admin/users/{id}/edit`, `PUT /admin/users/{id}`

---

### Issue #4 - Implémenter la suppression d'utilisateur
**Labels** : `enhancement`, `admin`, `backend`  
**Priorité** : Moyenne  
**Estimation** : 0.5 jour

**Description :**
Permettre la suppression (soft delete) d'un utilisateur avec confirmation.

**Critères d'acceptation :**
- [ ] Modal de confirmation avant suppression
- [ ] Soft delete (ajout colonne `deleted_at`)
- [ ] Message de succès après suppression
- [ ] Utilisateur retiré de la liste principale
- [ ] Impossibilité de se supprimer soi-même
- [ ] Gestion des contraintes (ex: un enseignant avec des cours)

**Tâches techniques :**
- Migration : Ajouter `SoftDeletes` au modèle User
- Backend : `UserController@destroy`
- Frontend : Modal de confirmation
- Route : `DELETE /admin/users/{id}`

---

### Issue #5 - Créer la page de gestion des relations parent-élève
**Labels** : `enhancement`, `admin`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 1 jour

**Description :**
Interface pour lier des parents à leurs enfants (élèves).

**Critères d'acceptation :**
- [ ] Liste des relations existantes (parent → élèves)
- [ ] Bouton "Ajouter une relation"
- [ ] Formulaire : sélectionner un parent, un/des élève(s), type de relation
- [ ] Types de relation : Parent, Tuteur, Autre
- [ ] Un élève peut avoir plusieurs parents
- [ ] Suppression d'une relation avec confirmation
- [ ] Filtres par parent ou élève

**Tâches techniques :**
- Backend : `ParentStudentController` (index, store, destroy)
- Frontend : Composant `ParentStudentRelations.tsx`
- Routes : `GET /admin/parent-student`, `POST /admin/parent-student`, `DELETE /admin/parent-student/{id}`

---

### Issue #6 - Créer les seeders pour données de test
**Labels** : `enhancement`, `backend`, `testing`  
**Priorité** : Moyenne  
**Estimation** : 0.5 jour

**Description :**
Créer des seeders pour générer des données de test réalistes.

**Critères d'acceptation :**
- [ ] Seeder pour utilisateurs (1 admin, 5 enseignants, 30 élèves, 20 parents)
- [ ] Attribution automatique de rôles
- [ ] Génération de relations parent-élève cohérentes
- [ ] Mot de passe par défaut : "password"
- [ ] Données en français
- [ ] Commande : `php artisan db:seed --class=UsersSeeder`

**Tâches techniques :**
- `database/seeders/UsersSeeder.php`
- Utiliser Faker avec locale 'fr_FR'

---

### Issue #7 - Ajouter les middleware de vérification des rôles admin
**Labels** : `enhancement`, `backend`, `security`  
**Priorité** : Critique  
**Estimation** : 0.5 jour

**Description :**
Sécuriser toutes les routes d'administration avec un middleware.

**Critères d'acceptation :**
- [ ] Middleware `EnsureUserIsAdmin`
- [ ] Vérification que l'utilisateur a le rôle `admin` ou `superadmin`
- [ ] Redirection vers dashboard si non autorisé
- [ ] Application sur toutes les routes `/admin/*`
- [ ] Message d'erreur approprié

**Tâches techniques :**
- Créer middleware `EnsureUserIsAdmin`
- Appliquer dans `routes/web.php`
- Tests de sécurité

---

### Issue #8 - Créer les tests pour la gestion des utilisateurs
**Labels** : `testing`, `backend`  
**Priorité** : Haute  
**Estimation** : 0.5 jour

**Description :**
Tests pour les fonctionnalités CRUD des utilisateurs.

**Critères d'acceptation :**
- [ ] Test : Liste des utilisateurs accessible par admin
- [ ] Test : Création d'utilisateur avec validation
- [ ] Test : Modification d'utilisateur
- [ ] Test : Suppression d'utilisateur
- [ ] Test : Non-admin ne peut pas accéder
- [ ] Test : Recherche et filtres fonctionnent
- [ ] Couverture > 80%

**Tâches techniques :**
- `tests/Feature/Admin/UserManagementTest.php`
- Utiliser factories pour les données de test

---

### Issue #9 - Documenter le module administration
**Labels** : `documentation`  
**Priorité** : Basse  
**Estimation** : 0.5 jour

**Description :**
Documentation du module administration pour les développeurs et utilisateurs.

**Critères d'acceptation :**
- [ ] Documentation API (routes, paramètres, réponses)
- [ ] Guide utilisateur admin (comment créer/modifier des utilisateurs)
- [ ] Captures d'écran des interfaces
- [ ] Exemples de code

**Tâches techniques :**
- Fichier `docs/admin-module.md`
- Documentation inline (PHPDoc, JSDoc)

---

## Milestone 2 - Structure scolaire

**Durée** : Semaine 2 (27 janvier - 2 février 2026)  
**Objectif** : Mettre en place la structure de base (années, classes, matières)

### Issue #10 - Créer le modèle et migration pour les années scolaires
**Labels** : `enhancement`, `backend`, `database`  
**Priorité** : Critique  
**Estimation** : 0.5 jour

**Description :**
Modèle et table pour gérer les années scolaires.

**Critères d'acceptation :**
- [ ] Table `school_years` : id, name, start_date, end_date, is_active, created_at, updated_at
- [ ] Modèle `SchoolYear` avec relations
- [ ] Une seule année active à la fois (contrainte)
- [ ] Méthode `scopeActive()` pour récupérer l'année active
- [ ] Migration avec index

**Tâches techniques :**
- Migration : `create_school_years_table`
- Modèle : `app/Models/SchoolYear.php`
- Seeder : Année 2025-2026 par défaut

---

### Issue #11 - Créer l'interface de configuration de l'année scolaire
**Labels** : `enhancement`, `admin`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 1 jour

**Description :**
Interface pour créer et gérer les années scolaires et leurs périodes.

**Critères d'acceptation :**
- [ ] Formulaire : nom, date début, date fin
- [ ] Définition des périodes (Trimestres ou Semestres)
- [ ] Bouton pour activer/désactiver une année
- [ ] Liste des années scolaires (actuelle + archives)
- [ ] Validation : dates cohérentes
- [ ] Warning si changement d'année active

**Tâches techniques :**
- Backend : `SchoolYearController`
- Frontend : `SchoolYearManagement.tsx`
- Routes : CRUD complet `/admin/school-years`

---

### Issue #12 - Créer le modèle et migration pour les classes
**Labels** : `enhancement`, `backend`, `database`  
**Priorité** : Critique  
**Estimation** : 0.5 jour

**Description :**
Modèle et table pour les classes scolaires.

**Critères d'acceptation :**
- [ ] Table `classes` : id, name, level, school_year_id, capacity, created_at, updated_at
- [ ] Modèle `Classe` (ou `SchoolClass`)
- [ ] Relation `belongsTo` SchoolYear
- [ ] Relation `hasMany` Students (users avec rôle student)
- [ ] Unique constraint sur (name, school_year_id)

**Tâches techniques :**
- Migration : `create_classes_table`
- Modèle : `app/Models/Classe.php`
- Relations avec User et SchoolYear

---

### Issue #13 - Créer l'interface de gestion des classes
**Labels** : `enhancement`, `admin`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 1 jour

**Description :**
CRUD complet pour les classes.

**Critères d'acceptation :**
- [ ] Liste des classes de l'année active
- [ ] Création : nom, niveau, capacité
- [ ] Modification des informations
- [ ] Suppression avec confirmation
- [ ] Affichage du nombre d'élèves dans chaque classe
- [ ] Filtre par niveau
- [ ] Design : cards ou table

**Tâches techniques :**
- Backend : `ClasseController`
- Frontend : `ClasseManagement.tsx`
- Routes : CRUD `/admin/classes`

---

### Issue #14 - Créer l'interface d'attribution des élèves aux classes
**Labels** : `enhancement`, `admin`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 1 jour

**Description :**
Interface pour assigner des élèves à une classe.

**Critères d'acceptation :**
- [ ] Vue détaillée d'une classe avec liste des élèves
- [ ] Bouton "Ajouter des élèves"
- [ ] Modal avec liste des élèves non assignés (ou d'autres classes)
- [ ] Sélection multiple d'élèves
- [ ] Retrait d'un élève de la classe
- [ ] Vérification de la capacité maximale
- [ ] Table pivot `class_student` : class_id, user_id, school_year_id

**Tâches techniques :**
- Migration : `create_class_student_table`
- Backend : `ClasseController@addStudents`, `@removeStudent`
- Frontend : Composant `ClasseStudents.tsx`
- Routes : `POST /admin/classes/{id}/students`, `DELETE /admin/classes/{id}/students/{studentId}`

---

### Issue #15 - Créer le modèle et migration pour les matières
**Labels** : `enhancement`, `backend`, `database`  
**Priorité** : Critique  
**Estimation** : 0.5 jour

**Description :**
Modèle et table pour les matières/cours.

**Critères d'acceptation :**
- [ ] Table `subjects` : id, name, code, coefficient, description, created_at, updated_at
- [ ] Modèle `Subject`
- [ ] Code unique (ex: MATH, FR, PHYS)
- [ ] Coefficient par défaut : 1
- [ ] Relation avec les enseignants et classes

**Tâches techniques :**
- Migration : `create_subjects_table`
- Modèle : `app/Models/Subject.php`
- Seeder : Matières courantes (Maths, Français, etc.)

---

### Issue #16 - Créer l'interface de gestion des matières
**Labels** : `enhancement`, `admin`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 0.5 jour

**Description :**
CRUD simple pour les matières.

**Critères d'acceptation :**
- [ ] Liste des matières
- [ ] Création : nom, code, coefficient
- [ ] Modification
- [ ] Suppression (vérifier si utilisée)
- [ ] Affichage du nombre d'attributions

**Tâches techniques :**
- Backend : `SubjectController`
- Frontend : `SubjectManagement.tsx`
- Routes : CRUD `/admin/subjects`

---

### Issue #17 - Créer le système d'attribution matière-classe-enseignant
**Labels** : `enhancement`, `admin`, `frontend`, `backend`  
**Priorité** : Critique  
**Estimation** : 1.5 jour

**Description :**
Système pour assigner un enseignant à une matière pour une classe spécifique.

**Critères d'acceptation :**
- [ ] Table `class_subject_teacher` : id, class_id, subject_id, teacher_id, school_year_id
- [ ] Interface d'attribution
- [ ] Vue par classe : assigner matières et enseignants
- [ ] Vue par enseignant : voir ses attributions
- [ ] Un enseignant peut enseigner plusieurs matières
- [ ] Une matière peut avoir plusieurs enseignants (classes différentes)
- [ ] Validation : pas de doublon (classe + matière)

**Tâches techniques :**
- Migration : `create_class_subject_teacher_table`
- Backend : `TeachingAssignmentController`
- Frontend : `TeachingAssignments.tsx`
- Routes : CRUD `/admin/teaching-assignments`

---

## Milestone 3 - Gestion des notes - Enseignants

**Durée** : Semaine 3 (3-9 février 2026)  
**Objectif** : Permettre aux enseignants de créer des évaluations et saisir les notes

### Issue #18 - Créer le modèle et migration pour les évaluations
**Labels** : `enhancement`, `backend`, `database`  
**Priorité** : Critique  
**Estimation** : 0.5 jour

**Description :**
Modèle et table pour les évaluations/contrôles.

**Critères d'acceptation :**
- [ ] Table `evaluations` : id, title, type, date, coefficient, max_score, class_id, subject_id, teacher_id, status, created_at, updated_at
- [ ] Types : devoir, controle, examen, oral
- [ ] Statuts : brouillon, publiee
- [ ] max_score par défaut : 20
- [ ] Relations avec Class, Subject, Teacher

**Tâches techniques :**
- Migration : `create_evaluations_table`
- Modèle : `app/Models/Evaluation.php`
- Enum pour types et statuts

---

### Issue #19 - Créer l'interface de création d'évaluation
**Labels** : `enhancement`, `teacher`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 1 jour

**Description :**
Formulaire pour qu'un enseignant crée une évaluation.

**Critères d'acceptation :**
- [ ] Formulaire : titre, type, date, coefficient, note max
- [ ] Sélection de la classe (parmi celles enseignées)
- [ ] Sélection de la matière (automatique selon attribution)
- [ ] Bouton "Enregistrer comme brouillon"
- [ ] Bouton "Publier"
- [ ] Validation des champs
- [ ] Redirection vers liste des évaluations

**Tâches techniques :**
- Backend : `EvaluationController@create`, `@store`
- Frontend : `CreateEvaluation.tsx`
- Routes : `GET /teacher/evaluations/create`, `POST /teacher/evaluations`

---

### Issue #20 - Créer la liste des évaluations pour enseignants
**Labels** : `enhancement`, `teacher`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 0.5 jour

**Description :**
Page listant toutes les évaluations de l'enseignant.

**Critères d'acceptation :**
- [ ] Liste des évaluations créées par l'enseignant
- [ ] Affichage : titre, classe, matière, date, statut, notes saisies/total élèves
- [ ] Filtres : classe, matière, statut, période
- [ ] Tri par date
- [ ] Actions : Modifier, Saisir notes, Supprimer
- [ ] Badge de statut (brouillon/publiée)

**Tâches techniques :**
- Backend : `EvaluationController@index`
- Frontend : `EvaluationsList.tsx`
- Route : `GET /teacher/evaluations`

---

### Issue #21 - Créer le modèle et migration pour les notes
**Labels** : `enhancement`, `backend`, `database`  
**Priorité** : Critique  
**Estimation** : 0.5 jour

**Description :**
Modèle et table pour stocker les notes des élèves.

**Critères d'acceptation :**
- [ ] Table `grades` : id, evaluation_id, student_id, score, is_absent, comment, created_at, updated_at
- [ ] Unique constraint (evaluation_id, student_id)
- [ ] score peut être NULL si absent
- [ ] Relations avec Evaluation et User (student)

**Tâches techniques :**
- Migration : `create_grades_table`
- Modèle : `app/Models/Grade.php`

---

### Issue #22 - Créer l'interface de saisie des notes
**Labels** : `enhancement`, `teacher`, `frontend`, `backend`  
**Priorité** : Critique  
**Estimation** : 1.5 jour

**Description :**
Interface optimisée pour saisir rapidement les notes d'une évaluation.

**Critères d'acceptation :**
- [ ] Table avec liste des élèves de la classe
- [ ] Input pour chaque note (type number)
- [ ] Checkbox "Absent" pour marquer un élève absent
- [ ] Validation : note entre 0 et max_score
- [ ] Sauvegarde automatique (debounce)
- [ ] Indicateur de progression (X/Y notes saisies)
- [ ] Calcul et affichage de la moyenne de la classe
- [ ] Statistiques : min, max, médiane
- [ ] Message de succès après sauvegarde

**Tâches techniques :**
- Backend : `GradeController@store` (bulk insert/update)
- Frontend : `GradeInput.tsx` avec auto-save
- Route : `POST /teacher/evaluations/{id}/grades`

---

### Issue #23 - Implémenter le système de calcul des moyennes
**Labels** : `enhancement`, `backend`  
**Priorité** : Critique  
**Estimation** : 1 jour

**Description :**
Service pour calculer automatiquement les moyennes des élèves.

**Critères d'acceptation :**
- [ ] Service `GradeCalculationService`
- [ ] Calcul de la moyenne par matière (avec coefficients des évaluations)
- [ ] Calcul de la moyenne générale (avec coefficients des matières)
- [ ] Exclusion des évaluations en brouillon
- [ ] Exclusion des notes d'élèves absents
- [ ] Calcul par période (trimestre/semestre)
- [ ] Méthode : `calculateStudentAverage($studentId, $subjectId, $period)`
- [ ] Méthode : `calculateStudentGeneralAverage($studentId, $period)`
- [ ] Cache des résultats pour performance

**Tâches techniques :**
- Service : `app/Services/GradeCalculationService.php`
- Tests unitaires complets
- Documentation des formules de calcul

---

### Issue #24 - Créer les tests pour le module notes
**Labels** : `testing`, `backend`  
**Priorité** : Haute  
**Estimation** : 0.5 jour

**Description :**
Tests pour les fonctionnalités de gestion des notes.

**Critères d'acceptation :**
- [ ] Test : Création d'évaluation par enseignant
- [ ] Test : Saisie de notes
- [ ] Test : Calcul de moyennes correct
- [ ] Test : Gestion des absences
- [ ] Test : Permissions (un enseignant ne voit que ses évaluations)
- [ ] Couverture > 80%

**Tâches techniques :**
- `tests/Feature/Teacher/GradeManagementTest.php`
- `tests/Unit/Services/GradeCalculationServiceTest.php`

---

## Milestone 4 - Consultation des notes - Élèves & Parents

**Durée** : Semaine 3 (suite) (3-9 février 2026)  
**Objectif** : Permettre aux élèves et parents de consulter les notes et moyennes

### Issue #25 - Créer le dashboard élève avec aperçu des notes
**Labels** : `enhancement`, `student`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 1 jour

**Description :**
Dashboard personnalisé pour l'élève avec vue d'ensemble de ses résultats.

**Critères d'acceptation :**
- [ ] Carte "Moyenne générale" avec chiffre proéminent
- [ ] Liste des moyennes par matière (nom, coefficient, moyenne)
- [ ] Section "Dernières notes" (5 dernières)
- [ ] Graphique simple d'évolution de la moyenne
- [ ] Indicateur de tendance (hausse/baisse)
- [ ] Période sélectionnable (trimestre/semestre)
- [ ] Design clair et motivant

**Tâches techniques :**
- Backend : `StudentDashboardController@index`
- Frontend : `StudentDashboard.tsx`
- Utiliser le `GradeCalculationService`
- Route : `GET /student/dashboard`

---

### Issue #26 - Créer la page de détail des notes par matière (élève)
**Labels** : `enhancement`, `student`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 1 jour

**Description :**
Page détaillée des notes d'un élève pour une matière spécifique.

**Critères d'acceptation :**
- [ ] Liste de toutes les évaluations de la matière
- [ ] Affichage : nom évaluation, type, date, note obtenue/max, coefficient
- [ ] Indication si absent
- [ ] Calcul et affichage de la moyenne de la matière
- [ ] Comparaison avec moyenne de classe (optionnel)
- [ ] Graphique d'évolution des notes
- [ ] Statistiques : meilleure/pire note

**Tâches techniques :**
- Backend : `StudentGradeController@showSubject`
- Frontend : `SubjectGrades.tsx`
- Route : `GET /student/subjects/{id}/grades`

---

### Issue #27 - Créer le dashboard parent avec sélecteur d'enfant
**Labels** : `enhancement`, `parent`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 1 jour

**Description :**
Dashboard pour les parents avec possibilité de voir plusieurs enfants.

**Critères d'acceptation :**
- [ ] Dropdown de sélection de l'enfant (si plusieurs)
- [ ] Sauvegarde du choix en session
- [ ] Affichage identique au dashboard élève pour l'enfant sélectionné
- [ ] Carte d'information de l'enfant (nom, classe)
- [ ] Bouton de bascule rapide entre enfants
- [ ] Alertes spécifiques (nouvelles notes, absences)

**Tâches techniques :**
- Backend : `ParentDashboardController@index`
- Frontend : `ParentDashboard.tsx` avec state management
- Route : `GET /parent/dashboard`
- API : `GET /parent/children` pour liste des enfants

---

### Issue #28 - Créer la page de consultation des notes pour parents
**Labels** : `enhancement`, `parent`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 0.5 jour

**Description :**
Pages de consultation des notes similaires à l'espace élève.

**Critères d'acceptation :**
- [ ] Réutilisation des composants de l'espace élève
- [ ] Vérification : le parent peut uniquement voir ses enfants
- [ ] Navigation entre les matières
- [ ] Export PDF des notes (optionnel MVP)

**Tâches techniques :**
- Backend : `ParentGradeController`
- Routes : `/parent/children/{id}/grades`, `/parent/children/{id}/subjects/{subjectId}/grades`
- Middleware de vérification parent-enfant

---

### Issue #29 - Créer l'API pour récupérer les moyennes
**Labels** : `enhancement`, `backend`, `api`  
**Priorité** : Haute  
**Estimation** : 0.5 jour

**Description :**
Endpoints API pour récupérer les moyennes (utilisé par frontend).

**Critères d'acceptation :**
- [ ] `GET /api/students/{id}/averages` : toutes les moyennes
- [ ] `GET /api/students/{id}/subjects/{subjectId}/average` : moyenne d'une matière
- [ ] Format JSON standardisé
- [ ] Paramètres : period (optional)
- [ ] Cache des résultats (5 minutes)
- [ ] Gestion des permissions

**Tâches techniques :**
- Controller : `Api\AverageController`
- Middleware : auth + permissions
- Documentation API

---

### Issue #30 - Créer les tests pour la consultation des notes
**Labels** : `testing`, `backend`  
**Priorité** : Moyenne  
**Estimation** : 0.5 jour

**Description :**
Tests pour les fonctionnalités de consultation des notes.

**Critères d'acceptation :**
- [ ] Test : Élève accède à ses notes
- [ ] Test : Parent accède aux notes de ses enfants
- [ ] Test : Parent ne peut pas voir les notes d'autres enfants
- [ ] Test : Élève ne peut pas voir les notes d'autres élèves
- [ ] Test : Moyennes calculées correctement affichées
- [ ] Couverture > 80%

**Tâches techniques :**
- `tests/Feature/Student/GradeConsultationTest.php`
- `tests/Feature/Parent/GradeConsultationTest.php`

---

## Milestone 5 - Gestion des présences

**Durée** : Semaine 4 (10-16 février 2026)  
**Objectif** : Système de gestion des présences/absences

### Issue #31 - Créer le modèle et migration pour les présences
**Labels** : `enhancement`, `backend`, `database`  
**Priorité** : Critique  
**Estimation** : 0.5 jour

**Description :**
Modèle et table pour enregistrer les présences.

**Critères d'acceptation :**
- [ ] Table `attendances` : id, student_id, class_id, subject_id, teacher_id, date, status, comment, created_at, updated_at
- [ ] Status enum : present, absent, late (présent, absent, retard)
- [ ] Unique constraint (student_id, class_id, subject_id, date)
- [ ] Relations avec User, Class, Subject

**Tâches techniques :**
- Migration : `create_attendances_table`
- Modèle : `app/Models/Attendance.php`
- Enum `AttendanceStatus`

---

### Issue #32 - Créer l'interface d'appel pour enseignants
**Labels** : `enhancement`, `teacher`, `frontend`, `backend`  
**Priorité** : Critique  
**Estimation** : 1.5 jour

**Description :**
Interface rapide pour faire l'appel en début de cours.

**Critères d'acceptation :**
- [ ] Sélection de la classe et matière
- [ ] Pré-remplissage de la date du jour
- [ ] Liste des élèves de la classe
- [ ] Boutons rapides pour chaque élève : Présent, Absent, Retard
- [ ] Valeur par défaut : Présent
- [ ] Champ commentaire optionnel par élève
- [ ] Sauvegarde rapide de tout l'appel
- [ ] Confirmation visuelle après sauvegarde
- [ ] Design optimisé pour mobile (utilisation en classe)

**Tâches techniques :**
- Backend : `AttendanceController@create`, `@store`
- Frontend : `TakeAttendance.tsx`
- Routes : `GET /teacher/attendance/create`, `POST /teacher/attendance`
- Bulk insert optimisé

---

### Issue #33 - Créer l'historique des appels pour enseignants
**Labels** : `enhancement`, `teacher`, `frontend`, `backend`  
**Priorité** : Moyenne  
**Estimation** : 0.5 jour

**Description :**
Page listant les appels effectués avec possibilité de modification.

**Critères d'acceptation :**
- [ ] Liste des appels par date (ordre décroissant)
- [ ] Filtres : classe, matière, date
- [ ] Affichage : date, classe, matière, nb absents/retards
- [ ] Bouton "Modifier" (si même jour uniquement pour MVP)
- [ ] Vue détaillée d'un appel

**Tâches techniques :**
- Backend : `AttendanceController@index`, `@show`
- Frontend : `AttendanceHistory.tsx`
- Route : `GET /teacher/attendance`

---

### Issue #34 - Créer la page de consultation des absences pour élèves
**Labels** : `enhancement`, `student`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 0.5 jour

**Description :**
Page permettant à l'élève de voir ses absences et retards.

**Critères d'acceptation :**
- [ ] Liste de toutes les absences/retards
- [ ] Affichage : date, matière, statut, commentaire
- [ ] Statistiques : total absences, total retards
- [ ] Filtre par période
- [ ] Vue calendrier (optionnel)
- [ ] Code couleur (absent rouge, retard orange)

**Tâches techniques :**
- Backend : `StudentAttendanceController@index`
- Frontend : `StudentAttendance.tsx`
- Route : `GET /student/attendance`

---

### Issue #35 - Créer la page de consultation des absences pour parents
**Labels** : `enhancement`, `parent`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 0.5 jour

**Description :**
Page similaire à celle des élèves, pour les parents.

**Critères d'acceptation :**
- [ ] Sélection de l'enfant
- [ ] Vue identique à l'espace élève
- [ ] Alertes pour absences récentes
- [ ] Possibilité de voir plusieurs enfants

**Tâches techniques :**
- Backend : `ParentAttendanceController@index`
- Frontend : Réutiliser `StudentAttendance.tsx`
- Route : `GET /parent/children/{id}/attendance`
- Middleware de vérification parent-enfant

---

### Issue #36 - Créer le rapport des absences pour administration
**Labels** : `enhancement`, `admin`, `frontend`, `backend`  
**Priorité** : Moyenne  
**Estimation** : 1 jour

**Description :**
Interface pour l'administration pour suivre les absences globalement.

**Critères d'acceptation :**
- [ ] Vue d'ensemble : taux de présence global
- [ ] Filtres : classe, date, élève
- [ ] Liste des absences/retards avec tous les détails
- [ ] Statistiques par classe
- [ ] Export CSV des données
- [ ] Identification des élèves avec absences répétées
- [ ] Graphique de tendance

**Tâches techniques :**
- Backend : `AdminAttendanceController@report`
- Frontend : `AttendanceReport.tsx`
- Route : `GET /admin/attendance/report`
- Export : `GET /admin/attendance/export`

---

## Milestone 6 - Dashboards et navigation

**Durée** : Semaine 5 (17-23 février 2026)  
**Objectif** : Créer des dashboards personnalisés et améliorer la navigation

### Issue #37 - Améliorer le dashboard administrateur
**Labels** : `enhancement`, `admin`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 1 jour

**Description :**
Dashboard complet avec statistiques et KPIs pour l'administration.

**Critères d'acceptation :**
- [ ] Cartes de statistiques : total utilisateurs (par rôle), classes, matières
- [ ] Graphique : évolution des moyennes générales
- [ ] Graphique : taux de présence par classe
- [ ] Liste des dernières actions (utilisateurs créés, etc.)
- [ ] Alertes importantes (élèves en difficulté, absences répétées)
- [ ] Liens rapides vers actions fréquentes
- [ ] Période sélectionnable
- [ ] Design moderne avec icônes

**Tâches techniques :**
- Backend : `AdminDashboardController@index`
- Frontend : `AdminDashboard.tsx`
- Route : `GET /admin/dashboard`
- Composants : Cards, Charts (recharts ou chartjs)

---

### Issue #38 - Créer le dashboard enseignant complet
**Labels** : `enhancement`, `teacher`, `frontend`, `backend`  
**Priorité** : Haute  
**Estimation** : 1 jour

**Description :**
Dashboard pour les enseignants avec vue d'ensemble de leurs classes.

**Critères d'acceptation :**
- [ ] Section "Aujourd'hui" : cours du jour
- [ ] Carte "Mes classes" avec statistiques rapides
- [ ] Section "À faire" : évaluations à corriger, appels à faire
- [ ] Statistiques de mes classes : moyennes, présences
- [ ] Accès rapides : créer évaluation, faire l'appel, saisir notes
- [ ] Graphique : évolution des moyennes de mes classes
- [ ] Notifications : nouvelles inscriptions d'élèves

**Tâches techniques :**
- Backend : `TeacherDashboardController@index`
- Frontend : `TeacherDashboard.tsx`
- Route : `GET /teacher/dashboard`

---

### Issue #39 - Finaliser les dashboards élève et parent
**Labels** : `enhancement`, `student`, `parent`, `frontend`  
**Priorité** : Haute  
**Estimation** : 0.5 jour

**Description :**
Amélioration des dashboards élève et parent créés précédemment.

**Critères d'acceptation :**
- [ ] Design cohérent avec les autres dashboards
- [ ] Graphiques d'évolution
- [ ] Indicateurs visuels (badges, couleurs)
- [ ] Performance optimisée
- [ ] Animations subtiles

**Tâches techniques :**
- Refactoring des composants existants
- Ajout de graphiques
- Optimisation des requêtes

---

### Issue #40 - Créer le système de navigation adaptatif par rôle
**Labels** : `enhancement`, `frontend`, `ui`  
**Priorité** : Critique  
**Estimation** : 1 jour

**Description :**
Menu de navigation qui s'adapte selon le rôle de l'utilisateur.

**Critères d'acceptation :**
- [ ] **Admin** : Dashboard, Utilisateurs, Classes, Matières, Rapports, Paramètres
- [ ] **Enseignant** : Dashboard, Mes Classes, Évaluations, Notes, Présences, Profil
- [ ] **Élève** : Dashboard, Mes Notes, Mes Présences, Profil
- [ ] **Parent** : Dashboard, Mes Enfants, Notes, Présences, Profil
- [ ] Menu responsive (burger menu sur mobile)
- [ ] Active state sur page actuelle
- [ ] Icônes pour chaque section
- [ ] Sous-menus si nécessaire

**Tâches techniques :**
- Composant : `Navigation.tsx` ou améliorer existant
- Helper : `getNavigationByRole(role)`
- Utiliser React Router pour active states
- Design : Sidebar desktop, bottom nav mobile

---

### Issue #41 - Créer la page de paramètres utilisateur
**Labels** : `enhancement`, `frontend`, `backend`  
**Priorité** : Moyenne  
**Estimation** : 0.5 jour

**Description :**
Page centralisée pour tous les paramètres du compte (déjà partiellement fait).

**Critères d'acceptation :**
- [ ] Onglets : Profil, Sécurité (mot de passe, 2FA), Apparence, Notifications
- [ ] Mise à jour du profil
- [ ] Changement de mot de passe
- [ ] Configuration 2FA
- [ ] Thème sombre/clair
- [ ] Préférences de notifications (optionnel MVP)
- [ ] Design cohérent

**Tâches techniques :**
- Améliorer les pages existantes dans `resources/js/pages/settings/`
- Ajouter onglet Notifications
- Backend déjà fait, améliorer frontend

---

### Issue #42 - Optimiser les performances des dashboards
**Labels** : `enhancement`, `backend`, `performance`  
**Priorité** : Moyenne  
**Estimation** : 0.5 jour

**Description :**
Optimisation des requêtes et mise en cache pour les dashboards.

**Critères d'acceptation :**
- [ ] Utilisation de query caching (5-15 minutes selon données)
- [ ] Eager loading des relations
- [ ] Requêtes optimisées (éviter N+1)
- [ ] Indexation des tables si nécessaire
- [ ] Temps de chargement < 1 seconde
- [ ] Lazy loading des graphiques

**Tâches techniques :**
- Utiliser Laravel Cache
- Optimiser les queries Eloquent
- Ajouter indexes dans migrations
- Profiling avec Laravel Debugbar

---

## Milestone 7 - Permissions et sécurité

**Durée** : Semaine 6 (24 février - 2 mars 2026)  
**Objectif** : Sécuriser l'application et implémenter les permissions

### Issue #43 - Créer le système de policies Laravel
**Labels** : `enhancement`, `backend`, `security`  
**Priorité** : Critique  
**Estimation** : 1 jour

**Description :**
Implémenter les policies pour chaque modèle.

**Critères d'acceptation :**
- [ ] Policy pour User (admin seulement)
- [ ] Policy pour Classe (admin et enseignants concernés)
- [ ] Policy pour Subject (admin seulement)
- [ ] Policy pour Evaluation (enseignant propriétaire)
- [ ] Policy pour Grade (enseignant qui a créé l'évaluation, élève concerné, parents)
- [ ] Policy pour Attendance (enseignant, élève concerné, parents)
- [ ] Utilisation dans les controllers : `$this->authorize()`
- [ ] Tests pour chaque policy

**Tâches techniques :**
- Policies : `app/Policies/*.php`
- Enregistrement dans `AuthServiceProvider`
- Tests : `tests/Unit/Policies/*.php`

---

### Issue #44 - Créer les middlewares de vérification des rôles
**Labels** : `enhancement`, `backend`, `security`  
**Priorité** : Critique  
**Estimation** : 0.5 jour

**Description :**
Middlewares pour restreindre l'accès par rôle.

**Critères d'acceptation :**
- [ ] Middleware `EnsureUserIsAdmin`
- [ ] Middleware `EnsureUserIsTeacher`
- [ ] Middleware `EnsureUserIsStudent`
- [ ] Middleware `EnsureUserIsParent`
- [ ] Middleware `Role:admin,teacher` (flexible)
- [ ] Redirection appropriée si non autorisé
- [ ] Message flash informatif

**Tâches techniques :**
- Créer middlewares dans `app/Http/Middleware/`
- Enregistrer dans `bootstrap/app.php`
- Appliquer dans `routes/web.php`
- Tests de sécurité

---

### Issue #45 - Implémenter la validation côté serveur pour tous les formulaires
**Labels** : `enhancement`, `backend`, `security`  
**Priorité** : Critique  
**Estimation** : 1 jour

**Description :**
Form Requests pour valider toutes les entrées utilisateur.

**Critères d'acceptation :**
- [ ] Form Request pour chaque formulaire : User, Classe, Subject, Evaluation, Grade, Attendance
- [ ] Validation des types de données
- [ ] Validation des règles métier (dates, cohérence)
- [ ] Messages d'erreur en français et clairs
- [ ] Gestion des erreurs de validation dans le frontend
- [ ] Sanitization des inputs

**Tâches techniques :**
- Form Requests : `app/Http/Requests/*.php`
- Messages personnalisés en français
- Tests de validation

---

### Issue #46 - Sécuriser les APIs et routes
**Labels** : `enhancement`, `backend`, `security`  
**Priorité** : Critique  
**Estimation** : 0.5 jour

**Description :**
Audit et sécurisation de toutes les routes.

**Critères d'acceptation :**
- [ ] Toutes les routes protégées par `auth` middleware minimum
- [ ] Routes admin protégées par `EnsureUserIsAdmin`
- [ ] CSRF protection activée (déjà par défaut Laravel)
- [ ] Rate limiting sur routes sensibles
- [ ] Logs des tentatives d'accès non autorisés
- [ ] Headers de sécurité (X-Frame-Options, etc.)

**Tâches techniques :**
- Audit de `routes/web.php`
- Configuration rate limiting
- Middleware de logging
- Tests de sécurité

---

### Issue #47 - Créer les tests de sécurité et permissions
**Labels** : `testing`, `backend`, `security`  
**Priorité** : Critique  
**Estimation** : 1 jour

**Description :**
Suite de tests complète pour la sécurité.

**Critères d'acceptation :**
- [ ] Tests : Accès non authentifié bloqué
- [ ] Tests : Élève ne peut pas accéder aux pages admin
- [ ] Tests : Parent ne peut voir que ses enfants
- [ ] Tests : Enseignant ne peut modifier que ses évaluations
- [ ] Tests : Élève ne peut voir que ses notes
- [ ] Tests : Validation des formulaires fonctionne
- [ ] Tests : Rate limiting fonctionne
- [ ] Couverture > 90% pour code de sécurité

**Tâches techniques :**
- `tests/Feature/Security/*.php`
- Tests d'intrusion simulés
- Vérification des policies

---

## Milestone 8 - Polish et finitions

**Durée** : Semaine 6 (suite) (24 février - 2 mars 2026)  
**Objectif** : Finaliser, tester et documenter le MVP

### Issue #48 - Implémenter les toast notifications et feedbacks
**Labels** : `enhancement`, `frontend`, `ui`  
**Priorité** : Haute  
**Estimation** : 0.5 jour

**Description :**
Système de notifications utilisateur cohérent.

**Critères d'acceptation :**
- [ ] Toast notifications pour : succès, erreur, info, warning
- [ ] Affichage temporaire (3-5 secondes)
- [ ] Position cohérente (top-right recommandé)
- [ ] Animations d'entrée/sortie
- [ ] File de notifications (plusieurs en même temps)
- [ ] Utilisation dans toute l'application
- [ ] Feedback visuel sur actions (loading spinners, disabled buttons)

**Tâches techniques :**
- Utiliser `sonner` ou `react-hot-toast`
- Composant global de notification
- Helper : `toast.success()`, `toast.error()`

---

### Issue #49 - Optimiser le responsive design
**Labels** : `enhancement`, `frontend`, `ui`  
**Priorité** : Haute  
**Estimation** : 1 jour

**Description :**
S'assurer que toutes les pages sont utilisables sur mobile.

**Critères d'acceptation :**
- [ ] Tests sur mobile (320px, 375px, 425px)
- [ ] Tests sur tablette (768px, 1024px)
- [ ] Navigation mobile optimisée
- [ ] Tables responsive (scroll horizontal ou cards)
- [ ] Formulaires adaptés (inputs de taille correcte)
- [ ] Modals responsive
- [ ] Graphiques responsive
- [ ] Touch-friendly (boutons suffisamment grands)

**Tâches techniques :**
- Audit de toutes les pages
- Utiliser TailwindCSS responsive utilities
- Tester sur vrais devices ou émulateurs

---

### Issue #50 - Créer la suite de tests E2E
**Labels** : `testing`, `e2e`  
**Priorité** : Moyenne  
**Estimation** : 1 jour

**Description :**
Tests end-to-end des workflows principaux.

**Critères d'acceptation :**
- [ ] Test : Workflow admin (créer utilisateur, créer classe, assigner élèves)
- [ ] Test : Workflow enseignant (créer évaluation, saisir notes)
- [ ] Test : Workflow élève (consulter notes)
- [ ] Test : Workflow parent (consulter notes enfant)
- [ ] Test : Authentication complète
- [ ] Utiliser Playwright ou Cypress
- [ ] Tests passent en CI

**Tâches techniques :**
- Setup Playwright
- Tests dans `tests/e2e/`
- Configuration CI

---

### Issue #51 - Créer la documentation utilisateur
**Labels** : `documentation`  
**Priorité** : Haute  
**Estimation** : 1 jour

**Description :**
Documentation complète pour les utilisateurs finaux.

**Critères d'acceptation :**
- [ ] Guide administrateur (gestion utilisateurs, classes, structure)
- [ ] Guide enseignant (évaluations, notes, présences)
- [ ] Guide parent/élève (consultation)
- [ ] FAQ
- [ ] Captures d'écran annotées
- [ ] Vidéos tutoriels (optionnel)
- [ ] Format : Markdown + site statique (VitePress, Docusaurus)

**Tâches techniques :**
- Dossier `docs/user/`
- Screenshots de l'interface
- Hébergement de la doc

---

### Issue #52 - Préparer le déploiement et la documentation technique
**Labels** : `documentation`, `devops`  
**Priorité** : Critique  
**Estimation** : 0.5 jour

**Description :**
Documentation technique et préparation au déploiement.

**Critères d'acceptation :**
- [ ] README.md à jour avec installation complète
- [ ] Guide de déploiement (serveur LAMP/LEMP)
- [ ] Configuration des variables d'environnement
- [ ] Script de déploiement (`deploy.sh`)
- [ ] Configuration de backup base de données
- [ ] Documentation API (optionnel)
- [ ] Checklist de pré-production
- [ ] Configuration SSL/HTTPS

**Tâches techniques :**
- Fichier `DEPLOY.md`
- Scripts de déploiement
- Configuration serveur exemple

---

## 📈 Suivi de progression

### Légende des statuts
- 🔴 À faire
- 🟡 En cours
- 🟢 Terminé
- ⏸️ Bloqué
- ❌ Annulé

### Progression par milestone

```
Milestone 1: ⬜⬜⬜⬜⬜⬜⬜⬜⬜ 0/9 issues (0%)
Milestone 2: ⬜⬜⬜⬜⬜⬜⬜⬜ 0/8 issues (0%)
Milestone 3: ⬜⬜⬜⬜⬜⬜⬜ 0/7 issues (0%)
Milestone 4: ⬜⬜⬜⬜⬜⬜ 0/6 issues (0%)
Milestone 5: ⬜⬜⬜⬜⬜⬜ 0/6 issues (0%)
Milestone 6: ⬜⬜⬜⬜⬜⬜ 0/6 issues (0%)
Milestone 7: ⬜⬜⬜⬜⬜ 0/5 issues (0%)
Milestone 8: ⬜⬜⬜⬜⬜ 0/5 issues (0%)

Total: ⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜⬜ 0/52 issues (0%)
```

---

## 🏷️ Labels utilisés

- `enhancement` : Nouvelle fonctionnalité
- `bug` : Correction de bug
- `documentation` : Documentation
- `testing` : Tests
- `security` : Sécurité
- `performance` : Optimisation
- `frontend` : Frontend React/TypeScript
- `backend` : Backend Laravel/PHP
- `database` : Base de données/Migrations
- `ui` : Interface utilisateur
- `api` : API REST
- `admin` : Fonctionnalité admin
- `teacher` : Fonctionnalité enseignant
- `student` : Fonctionnalité élève
- `parent` : Fonctionnalité parent
- `e2e` : Tests end-to-end
- `devops` : Déploiement/CI/CD

---

**Dernière mise à jour** : 17 janvier 2026  
**Version** : 1.0.0-MVP
