# NexSchool - Version MVP (Minimum Viable Product)

## Objectif du MVP

Créer une version fonctionnelle minimale de la plateforme permettant :
- La gestion des utilisateurs (admin, enseignants, élèves, parents)
- L'organisation de la structure scolaire (classes, matières)
- La saisie et consultation des notes
- Le suivi des présences
- Des dashboards simples par rôle

**Durée estimée** : 4-6 semaines  
**Date cible de livraison** : Fin février 2026

---

## Déjà implémenté

- [x] Structure Laravel + React + Inertia + TypeScript
- [x] Système d'authentification complet (login, register, 2FA)
- [x] Gestion du profil utilisateur
- [x] Système de rôles (superadmin, admin, teacher, parent, student, staff)
- [x] Relation parent-élève (base de données)
- [x] Layout et navigation de base

---

## Fonctionnalités MVP à développer

### 1 Administration - Gestion des utilisateurs (Semaine 1)

#### Interface d'administration
- [ ] **Liste des utilisateurs**
  - Table avec nom, email, rôle(s), statut
  - Filtres : par rôle, statut (actif/inactif)
  - Recherche par nom/email
  - Pagination

- [ ] **Création d'utilisateur**
  - Formulaire : nom, prénom, email, rôle(s)
  - Génération automatique de mot de passe
  - Envoi d'email de bienvenue (optionnel pour MVP)

- [ ] **Modification d'utilisateur**
  - Édition des informations de base
  - Attribution/retrait de rôles
  - Activation/désactivation du compte

- [ ] **Suppression d'utilisateur**
  - Soft delete préférable
  - Confirmation obligatoire

#### Gestion des relations parent-élève
- [ ] **Attribution parent-élève**
  - Interface pour lier un parent à un/plusieurs élève(s)
  - Type de relation (parent, tuteur, autre)
  - Un élève peut avoir plusieurs parents

### 2 Structure scolaire (Semaine 2)

#### Année scolaire
- [ ] **Configuration de l'année en cours**
  - Nom (ex: "2025-2026")
  - Date de début et fin
  - Périodes (Trimestre 1, 2, 3 ou Semestre 1, 2)
  - Une seule année active à la fois pour le MVP

#### Classes
- [ ] **Gestion des classes**
  - Création : nom (ex: "6ème A", "CM2 B"), niveau
  - Liste des classes de l'année en cours
  - Modification/Suppression

- [ ] **Attribution des élèves aux classes**
  - Interface pour assigner les élèves à une classe
  - Liste des élèves d'une classe
  - Retrait d'un élève d'une classe

#### Matières
- [ ] **Gestion des matières**
  - Création : nom (Mathématiques, Français, etc.), code (MATH, FR)
  - Coefficient (important pour les moyennes)
  - Liste, modification, suppression

- [ ] **Attribution matière-classe-enseignant**
  - Un enseignant enseigne une matière à une classe
  - Interface simple d'attribution
  - Liste des attributions

### 3 Gestion des notes - Enseignants (Semaine 3)

#### Évaluations
- [ ] **Création d'évaluation**
  - Titre (ex: "Contrôle chapitre 1")
  - Type (devoir, contrôle, examen)
  - Date
  - Coefficient
  - Note sur combien (20 par défaut)
  - Classe et matière concernées

- [ ] **Liste des évaluations**
  - Vue enseignant : ses évaluations
  - Filtres par classe, matière, période
  - Statut : brouillon, publiée

#### Saisie des notes
- [ ] **Interface de saisie**
  - Liste des élèves de la classe
  - Saisie rapide des notes
  - Validation : note entre 0 et max
  - Possibilité d'élève absent à l'évaluation
  - Sauvegarde automatique

- [ ] **Modification des notes**
  - Édition après publication
  - Historique des modifications (optionnel MVP)

#### Calcul des moyennes
- [ ] **Moyennes automatiques**
  - Moyenne par matière pour chaque élève
  - Prise en compte des coefficients
  - Moyenne générale par période
  - Calcul en temps réel

### 4 Consultation des notes - Élèves & Parents (Semaine 3)

#### Espace Élève
- [ ] **Dashboard élève**
  - Vue d'ensemble : moyenne générale, par matière
  - Dernières notes ajoutées
  - Graphique d'évolution (simple)

- [ ] **Détail par matière**
  - Liste des évaluations avec notes
  - Moyenne de la matière
  - Comparaison avec la moyenne de classe (optionnel)

#### Espace Parent
- [ ] **Dashboard parent**
  - Sélection de l'enfant (si plusieurs)
  - Vue d'ensemble de l'enfant sélectionné
  - Accès aux mêmes informations que l'élève

- [ ] **Notes par enfant**
  - Consultation identique à l'espace élève
  - Vue par matière et par période

### 5 Gestion des présences (Semaine 4)

#### Appel en classe - Enseignants
- [ ] **Interface d'appel**
  - Sélection de la classe et du cours
  - Liste des élèves
  - Statuts : Présent, Absent, Retard
  - Commentaire optionnel
  - Enregistrement rapide

- [ ] **Historique des appels**
  - Liste des appels effectués
  - Modification possible (même jour uniquement)

#### Consultation - Élèves & Parents
- [ ] **Suivi des absences**
  - Liste des absences/retards de l'élève
  - Vue calendrier (optionnel)
  - Statistiques simples (nombre d'absences, retards)

#### Vue Administration
- [ ] **Rapport des absences**
  - Liste des absences par classe/élève
  - Filtres par date, classe
  - Export CSV basique

### 6 Dashboards et navigation (Semaine 5)

#### Dashboard Admin
- [ ] **Vue d'ensemble**
  - Nombre total d'utilisateurs (par rôle)
  - Nombre de classes
  - Statistiques de base (moyennes générales, taux de présence)
  - Alertes importantes

#### Dashboard Enseignant
- [ ] **Vue d'ensemble**
  - Mes classes du jour
  - Prochaines évaluations à créer/corriger
  - Statistiques de mes classes
  - Accès rapides (créer évaluation, faire l'appel)

#### Dashboard Élève
- [ ] **Vue d'ensemble**
  - Ma classe
  - Mes moyennes
  - Mes dernières notes
  - Mes absences

#### Dashboard Parent
- [ ] **Vue d'ensemble**
  - Sélecteur d'enfant
  - Résumé de l'enfant sélectionné
  - Alertes (nouvelles notes, absences)

#### Navigation
- [ ] **Menu de navigation adapté par rôle**
  - Admin : Utilisateurs, Classes, Matières, Rapports
  - Enseignant : Mes Classes, Notes, Présences
  - Élève/Parent : Notes, Présences
  - Profil et Paramètres pour tous

### 7 Permissions et sécurité (Semaine 6)

#### Système de permissions
- [ ] **Middleware de vérification des rôles**
  - Restriction des routes par rôle
  - Vérification côté serveur obligatoire

- [ ] **Permissions granulaires**
  - Admin peut tout faire
  - Enseignant ne voit que ses classes
  - Parent ne voit que ses enfants
  - Élève ne voit que ses propres données

#### Validations
- [ ] **Validation des formulaires**
  - Validation côté client (React)
  - Validation côté serveur (Laravel)
  - Messages d'erreur clairs

### 8 Polish et finitions (Semaine 6)

#### UI/UX
- [ ] **Messages de feedback**
  - Toast notifications pour succès/erreurs
  - Confirmations pour actions critiques
  - Loading states

- [ ] **Responsive**
  - Toutes les pages fonctionnelles sur mobile
  - Navigation mobile adaptée

#### Tests
- [ ] **Tests critiques**
  - Tests des principales fonctionnalités
  - Tests d'authentification et autorisations
  - Tests de calcul de moyennes

#### Documentation MVP
- [ ] **Guide de démarrage rapide**
  - Installation
  - Configuration initiale
  - Création du premier utilisateur admin

---

## Hors scope du MVP (pour versions ultérieures)

❌ Emploi du temps  
❌ Messagerie interne  
❌ Ressources pédagogiques / Documents  
❌ Devoirs et travaux à rendre  
❌ Bulletins scolaires générés (PDF)  
❌ Justificatifs d'absence  
❌ Notifications email/push automatiques  
❌ Import/Export en masse (Excel/CSV)  
❌ Statistiques avancées et graphiques complexes  
❌ Multi-établissements  
❌ Application mobile native  

---

## Critères de réussite du MVP

### Fonctionnel
✅ Un admin peut créer des utilisateurs (enseignants, élèves, parents)  
✅ Un admin peut créer des classes et y assigner des élèves  
✅ Un admin peut créer des matières et les assigner aux enseignants/classes  
✅ Un enseignant peut créer des évaluations et saisir les notes  
✅ Un élève peut consulter ses notes et moyennes  
✅ Un parent peut consulter les notes de ses enfants  
✅ Un enseignant peut faire l'appel et enregistrer les présences  
✅ Les présences sont consultables par élèves/parents  

### Technique
✅ L'application est sécurisée (authentification, autorisations)  
✅ Les calculs de moyennes sont corrects  
✅ L'interface est responsive  
✅ Les données sont validées  
✅ Les tests principaux passent  

### Utilisabilité
✅ L'interface est intuitive et claire  
✅ Les actions fréquentes sont rapides  
✅ Les erreurs sont compréhensibles  
✅ La navigation est cohérente  

---

## Planning détaillé

### Semaine 1 (20-26 Jan) - Administration
- Lundi-Mardi : Interface utilisateurs (CRUD)
- Mercredi-Jeudi : Gestion des rôles et permissions
- Vendredi : Relations parent-élève

### Semaine 2 (27 Jan - 2 Fév) - Structure
- Lundi : Année scolaire
- Mardi-Mercredi : Gestion des classes
- Jeudi-Vendredi : Gestion des matières et attributions

### Semaine 3 (3-9 Fév) - Notes
- Lundi-Mardi : Création évaluations et saisie notes (enseignant)
- Mercredi : Calcul des moyennes
- Jeudi-Vendredi : Consultation notes (élèves/parents)

### Semaine 4 (10-16 Fév) - Présences
- Lundi-Mardi : Interface appel (enseignant)
- Mercredi : Consultation présences (élèves/parents)
- Jeudi-Vendredi : Rapports admin

### Semaine 5 (17-23 Fév) - Dashboards
- Lundi : Dashboard admin
- Mardi : Dashboard enseignant
- Mercredi : Dashboard élève
- Jeudi : Dashboard parent
- Vendredi : Navigation et menus

### Semaine 6 (24 Fév - 2 Mars) - Finitions
- Lundi-Mardi : Permissions et sécurité
- Mercredi : Tests
- Jeudi : Polish UI/UX
- Vendredi : Documentation et déploiement

---

## Stack technique du MVP

### Backend
- Laravel 12
- PostgreSQL
- API RESTful via Inertia

### Frontend
- React 19 + TypeScript
- Inertia.js
- TailwindCSS + shadcn/ui
- React Query (pour cache et optimisations)

### Tests
- PHPUnit (backend)
- Jest/Vitest (frontend, optionnel MVP)

### Déploiement
- Serveur LAMP/LEMP classique
- OU Forge/Vapor/DigitalOcean

---

**Version** : 1.0.0-MVP  
**Dernière mise à jour** : 17 janvier 2026  
**Statut** : 📝 Planification
