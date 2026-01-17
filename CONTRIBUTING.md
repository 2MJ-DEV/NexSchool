# Guide de contribution à NexSchool

Merci de votre intérêt pour contribuer à NexSchool ! Ce guide vous aidera à comprendre comment participer au développement de la plateforme.

## Table des matières

- [Code de conduite](#code-de-conduite)
- [Comment puis-je contribuer ?](#comment-puis-je-contribuer)
- [Structure du projet](#structure-du-projet)
- [Configuration de l'environnement de développement](#configuration-de-lenvironnement-de-développement)
- [Workflow de développement](#workflow-de-développement)
- [Standards de code](#standards-de-code)
- [Processus de Pull Request](#processus-de-pull-request)
- [Conventions de commit](#conventions-de-commit)
- [Tests](#tests)
- [Documentation](#documentation)
- [Communauté](#communauté)

---

## Code de conduite

En participant à ce projet, vous acceptez de respecter notre code de conduite. Soyez respectueux, inclusif et professionnel dans toutes vos interactions.

### Nos engagements

- Utiliser un langage accueillant et inclusif
- Respecter les points de vue et expériences différents
- Accepter gracieusement les critiques constructives
- Se concentrer sur ce qui est le mieux pour la communauté
- Faire preuve d'empathie envers les autres membres de la communauté

---

## Comment puis-je contribuer ?

Il existe plusieurs façons de contribuer à NexSchool :

### 🐛 Signaler des bugs

Si vous trouvez un bug :

1. Vérifiez d'abord qu'il n'existe pas déjà dans les [Issues](https://github.com/2MJ-DEV/NexSchool/issues)
2. Créez une nouvelle issue avec le label `bug`
3. Utilisez le template de bug report
4. Incluez :
   - Description claire du problème
   - Étapes pour reproduire
   - Comportement attendu vs observé
   - Captures d'écran si pertinent
   - Environnement (OS, navigateur, version PHP/Node)

### 💡 Proposer des fonctionnalités

Pour proposer une nouvelle fonctionnalité :

1. Vérifiez qu'elle n'est pas déjà dans [TODO.md](TODO.md) ou [MVP.md](MVP.md)
2. Créez une issue avec le label `enhancement`
3. Décrivez clairement :
   - Le problème que cela résout
   - La solution proposée
   - Les alternatives considérées
   - Des mockups si possible

### 📝 Améliorer la documentation

La documentation peut toujours être améliorée :

- Corriger des typos ou clarifier des explications
- Ajouter des exemples
- Traduire la documentation
- Créer des tutoriels ou guides

### 💻 Contribuer au code

Consultez les issues avec les labels :
- `good first issue` : Parfait pour débuter
- `help wanted` : Nous avons besoin d'aide
- `priority: high` : Important pour le projet

---

## Structure du projet

```
NexSchool/
├── app/                    # Code Laravel (Backend)
│   ├── Http/
│   │   ├── Controllers/   # Contrôleurs
│   │   ├── Middleware/    # Middlewares
│   │   └── Requests/      # Form Requests (validation)
│   ├── Models/            # Modèles Eloquent
│   ├── Policies/          # Policies (autorisations)
│   └── Services/          # Services métier
├── resources/             # Frontend
│   ├── js/
│   │   ├── components/    # Composants React réutilisables
│   │   ├── layouts/       # Layouts de page
│   │   ├── pages/         # Pages Inertia
│   │   └── types/         # Types TypeScript
│   └── css/               # Styles
├── routes/                # Routes de l'application
├── database/
│   ├── migrations/        # Migrations de base de données
│   └── seeders/           # Seeders
├── tests/                 # Tests
│   ├── Feature/           # Tests fonctionnels
│   └── Unit/              # Tests unitaires
├── docs/                  # Documentation
├── TODO.md                # Fonctionnalités complètes
├── MVP.md                 # Fonctionnalités MVP
└── ISSUES.md              # Issues organisées par milestones
```

---

## Configuration de l'environnement de développement

### Prérequis

- PHP >= 8.2
- Composer
- Node.js >= 18
- npm ou yarn
- PostgreSQL
- Git

### Installation

1. **Fork et clone le repository**

```bash
git clone https://github.com/VOTRE-USERNAME/nexschool.git
cd nexschool
```

2. **Installer les dépendances PHP**

```bash
composer install
```

3. **Installer les dépendances JavaScript**

```bash
npm install
```

4. **Configuration de l'environnement**

```bash
cp .env.example .env
php artisan key:generate
```

5. **Configurer la base de données**

Éditez `.env` avec vos informations de base de données :

```env
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=Nexschool
DB_USERNAME=postgres
DB_PASSWORD=votre_mot_de_passe
```

6. **Exécuter les migrations et seeders**

```bash
php artisan migrate --seed
```

7. **Compiler les assets**

```bash
npm run dev
```

8. **Démarrer le serveur de développement**

Dans un terminal :
```bash
php artisan serve
```

Dans un autre terminal :
```bash
npm run dev
```

L'application sera accessible à `http://localhost:8000`

### Comptes de test

Après le seeding, vous pouvez utiliser :

- **Admin** : admin@nexschool.test / password
- **Enseignant** : teacher@nexschool.test / password
- **Élève** : student@nexschool.test / password
- **Parent** : parent@nexschool.test / password

---

## Workflow de développement

### 1. Créer une branche

Créez toujours une nouvelle branche pour votre travail :

```bash
git checkout -b type/description-courte
```

Types de branches :
- `feature/nom-fonctionnalite` : Nouvelle fonctionnalité
- `fix/nom-bug` : Correction de bug
- `docs/sujet` : Documentation
- `refactor/composant` : Refactoring
- `test/composant` : Ajout de tests

Exemples :
```bash
git checkout -b feature/student-dashboard
git checkout -b fix/grade-calculation
git checkout -b docs/api-documentation
```

### 2. Développer

- Faites des commits atomiques et logiques
- Testez votre code localement
- Respectez les standards de code
- Ajoutez des tests si nécessaire

### 3. Pousser vos modifications

```bash
git push origin votre-branche
```

### 4. Créer une Pull Request

Voir la section [Processus de Pull Request](#processus-de-pull-request) ci-dessous.

---

## Standards de code

### Backend (PHP/Laravel)

- Suivre [PSR-12](https://www.php-fig.org/psr/psr-12/) pour le style de code
- Utiliser les fonctionnalités modernes de PHP 8.2+
- Nommer les classes en PascalCase
- Nommer les méthodes en camelCase
- Typage strict : utiliser les types de retour et paramètres

**Exemple :**

```php
<?php

namespace App\Services;

class GradeCalculationService
{
    public function calculateAverage(int $studentId, int $subjectId): float
    {
        // Implementation
    }
}
```

**Vérifier le code avec Laravel Pint :**

```bash
./vendor/bin/pint
```

### Frontend (React/TypeScript)

- Utiliser TypeScript pour tout nouveau code
- Composants fonctionnels avec hooks
- Nommer les composants en PascalCase
- Nommer les fonctions/variables en camelCase
- Props typées avec des interfaces

**Exemple :**

```tsx
interface StudentCardProps {
    student: Student;
    onSelect: (id: number) => void;
}

export default function StudentCard({ student, onSelect }: StudentCardProps) {
    return (
        <div className="card">
            <h3>{student.name}</h3>
            <button onClick={() => onSelect(student.id)}>Sélectionner</button>
        </div>
    );
}
```

**Vérifier le code avec ESLint :**

```bash
npm run lint
```

**Formater le code avec Prettier :**

```bash
npm run format
```

### Base de données

- Nommer les tables au pluriel en snake_case : `school_years`, `class_student`
- Nommer les colonnes en snake_case : `created_at`, `is_active`
- Toujours inclure `created_at` et `updated_at`
- Utiliser les clés étrangères avec constraints
- Ajouter des indexes pour les colonnes fréquemment recherchées

---

## Processus de Pull Request

### Avant de créer une PR

- [ ] Votre code compile sans erreur
- [ ] Tous les tests passent (`php artisan test` et `npm run test`)
- [ ] Le code est formaté (`./vendor/bin/pint` et `npm run format`)
- [ ] Pas de console.log oubliés
- [ ] La documentation est à jour si nécessaire
- [ ] Les migrations sont créées si modification de BDD

### Créer la Pull Request

1. **Titre clair et descriptif**

Format : `[Type] Description courte`

Exemples :
```
[Feature] Ajout du dashboard étudiant
[Fix] Correction du calcul de moyenne
[Docs] Documentation du module d'authentification
[Refactor] Amélioration du composant UserList
```

2. **Description détaillée**

Utilisez le template suivant :

```markdown
## Description
Brève description de ce que fait cette PR.

## Type de changement
- [ ] Bug fix (correction sans breaking change)
- [ ] Nouvelle fonctionnalité (ajout sans breaking change)
- [ ] Breaking change (modification qui casse la compatibilité)
- [ ] Documentation

## Issue liée
Closes #123

## Changements effectués
- Ajout de X
- Modification de Y
- Suppression de Z

## Captures d'écran (si UI)
[Ajouter des screenshots]

## Tests effectués
- [ ] Tests unitaires ajoutés/mis à jour
- [ ] Tests fonctionnels passent
- [ ] Testé manuellement sur navigateur X, Y

## Checklist
- [ ] Mon code suit les standards du projet
- [ ] J'ai commenté les parties complexes
- [ ] J'ai mis à jour la documentation
- [ ] Mes changements ne génèrent pas de nouveaux warnings
- [ ] J'ai ajouté des tests
- [ ] Tous les tests passent
```

3. **Demander une review**

- Assignez des reviewers appropriés
- Ajoutez les labels pertinents
- Liez l'issue correspondante

### Pendant la review

- Répondez aux commentaires rapidement
- Soyez ouvert aux suggestions
- Effectuez les modifications demandées
- Marquez les conversations comme résolues quand approprié
- Repoussez les commits de correction

### Après approbation

- Squash les commits si demandé
- Le merge sera effectué par un mainteneur

---

## Conventions de commit

Nous suivons [Conventional Commits](https://www.conventionalcommits.org/).

### Format

```
<type>(<scope>): <description>

[corps optionnel]

[footer optionnel]
```

### Types

- `feat`: Nouvelle fonctionnalité
- `fix`: Correction de bug
- `docs`: Documentation
- `style`: Formatage (sans changement de code)
- `refactor`: Refactoring
- `test`: Ajout/modification de tests
- `chore`: Maintenance (dependencies, config)
- `perf`: Amélioration de performance

### Scopes (optionnels)

- `auth`: Authentification
- `admin`: Module administration
- `teacher`: Module enseignant
- `student`: Module étudiant
- `parent`: Module parent
- `grades`: Gestion des notes
- `attendance`: Gestion des présences
- `ui`: Interface utilisateur

### Exemples

```bash
git commit -m "feat(student): ajouter le dashboard étudiant avec moyennes"
git commit -m "fix(grades): corriger le calcul de moyenne avec coefficients"
git commit -m "docs(api): documenter les endpoints d'évaluation"
git commit -m "refactor(components): extraire le composant UserCard"
git commit -m "test(grades): ajouter tests pour GradeCalculationService"
```

### Commits avec breaking changes

```bash
git commit -m "feat(api)!: changer le format de réponse des notes

BREAKING CHANGE: Le format JSON des notes a changé de {note, max} à {score, maxScore}
```

---

## Tests

### Backend - PHPUnit

**Exécuter tous les tests :**
```bash
php artisan test
```

**Exécuter un fichier spécifique :**
```bash
php artisan test tests/Feature/GradeManagementTest.php
```

**Exécuter un test spécifique :**
```bash
php artisan test --filter test_teacher_can_create_evaluation
```

**Avec couverture :**
```bash
php artisan test --coverage
```

### Types de tests backend

1. **Tests unitaires** (`tests/Unit/`)
   - Services
   - Helpers
   - Calculs

2. **Tests fonctionnels** (`tests/Feature/`)
   - Controllers
   - Routes
   - Policies
   - Intégration

**Exemple de test :**

```php
<?php

namespace Tests\Feature;

use App\Models\User;
use Tests\TestCase;

class GradeManagementTest extends TestCase
{
    public function test_teacher_can_create_evaluation(): void
    {
        $teacher = User::factory()->create();
        $teacher->roles()->attach(Role::where('name', 'teacher')->first());

        $response = $this->actingAs($teacher)->post('/teacher/evaluations', [
            'title' => 'Test Evaluation',
            'type' => 'controle',
            'date' => now()->toDateString(),
        ]);

        $response->assertRedirect();
        $this->assertDatabaseHas('evaluations', [
            'title' => 'Test Evaluation',
        ]);
    }
}
```

### Frontend - Jest/Vitest (optionnel pour MVP)

```bash
npm run test
```

### Bonnes pratiques

- Écrire des tests pour chaque nouvelle fonctionnalité
- Viser une couverture > 80%
- Tests lisibles : Arrange, Act, Assert
- Utiliser les factories pour les données de test
- Nettoyer les données après les tests

---

## Documentation

### Documentation du code

**Backend (PHPDoc) :**

```php
/**
 * Calcule la moyenne d'un étudiant pour une matière.
 *
 * @param int $studentId L'ID de l'étudiant
 * @param int $subjectId L'ID de la matière
 * @param string|null $period La période (optionnel)
 * @return float La moyenne calculée
 */
public function calculateAverage(int $studentId, int $subjectId, ?string $period = null): float
{
    // Implementation
}
```

**Frontend (JSDoc/TSDoc) :**

```tsx
/**
 * Composant pour afficher une carte d'étudiant
 * @param props - Les propriétés du composant
 * @param props.student - L'objet étudiant à afficher
 * @param props.onSelect - Callback appelé lors de la sélection
 */
export default function StudentCard({ student, onSelect }: StudentCardProps) {
    // Implementation
}
```

### Documentation des API

Documenter les endpoints dans le code :

```php
/**
 * Récupère les notes d'un étudiant
 * 
 * @group Grades
 * 
 * @urlParam studentId int required L'ID de l'étudiant
 * @queryParam period string optionnel La période (trimestre1, trimestre2, etc.)
 * 
 * @response 200 {
 *   "data": [
 *     {
 *       "evaluation": "Contrôle Maths",
 *       "score": 15,
 *       "max_score": 20,
 *       "date": "2026-01-15"
 *     }
 *   ]
 * }
 */
public function getGrades(int $studentId): JsonResponse
```

### Mettre à jour la documentation

- README.md : Installation et usage général
- TODO.md : Fonctionnalités complètes à implémenter
- MVP.md : Scope du MVP
- ISSUES.md : Issues détaillées par milestone
- docs/ : Documentation détaillée par module

---

## Communauté

### Communication

- **Issues GitHub** : Pour les bugs et fonctionnalités
- **Pull Requests** : Pour les discussions de code
- **Discussions** : Pour les questions générales

### Obtenir de l'aide

Si vous êtes bloqué :

1. Consultez la documentation
2. Recherchez dans les issues existantes
3. Posez une question dans Discussions
4. Demandez de l'aide sur la PR

### Reconnaissance

Tous les contributeurs sont ajoutés dans le fichier CONTRIBUTORS.md et dans les release notes.

---

## Ressources utiles

### Technologies utilisées

- [Laravel 12 Documentation](https://laravel.com/docs/12.x)
- [React 19 Documentation](https://react.dev)
- [Inertia.js Documentation](https://inertiajs.com)
- [TypeScript Documentation](https://www.typescriptlang.org/docs/)
- [TailwindCSS Documentation](https://tailwindcss.com/docs)
- [shadcn/ui Components](https://ui.shadcn.com)

### Outils de développement

- [Laravel Debugbar](https://github.com/barryvdh/laravel-debugbar) - Debug
- [Laravel Telescope](https://laravel.com/docs/telescope) - Monitoring
- [React DevTools](https://react.dev/learn/react-developer-tools) - Debug React

---

## Questions fréquentes

### Comment choisir une issue ?

1. Regardez les issues avec le label `good first issue` pour débuter
2. Vérifiez que l'issue n'est pas déjà assignée
3. Commentez pour dire que vous travaillez dessus
4. Un mainteneur vous l'assignera

### Combien de temps avant la review ?

Nous essayons de reviewer les PRs sous 2-3 jours ouvrés. Soyez patient et n'hésitez pas à faire un ping après une semaine.

### Ma PR a des conflits, que faire ?

Synchronisez avec la branche main :

```bash
git checkout main
git pull upstream main
git checkout votre-branche
git merge main
# Résolvez les conflits
git push origin votre-branche
```

### Je veux travailler sur quelque chose qui n'est pas une issue

Créez d'abord une issue pour en discuter avec les mainteneurs avant de commencer à coder.

---

## Remerciements

Merci de contribuer à NexSchool ! Chaque contribution, petite ou grande, fait une différence. 🎓✨

---

**Dernière mise à jour** : 17 janvier 2026
