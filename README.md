# NexSchool

> Plateforme moderne de gestion scolaire construite avec Laravel, React et Inertia.js

[![Laravel](https://img.shields.io/badge/Laravel-12-FF2D20?logo=laravel)](https://laravel.com)
[![React](https://img.shields.io/badge/React-19-61DAFB?logo=react)](https://react.dev)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.7-3178C6?logo=typescript)](https://www.typescriptlang.org)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

---

## Nos contributeurs
<a href="https://github.com/2MJ-DEV/NexSchool/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=2MJ-DEV/NexSchool" />
</a>

---

## À propos

**NexSchool** est une plateforme complète de gestion scolaire qui simplifie l'administration éducative, la gestion des notes, le suivi des présences et la communication entre enseignants, élèves et parents.

### Fonctionnalités principales

-  **Gestion multi-utilisateurs** - Administrateurs, enseignants, élèves, parents avec permissions granulaires
-  **Gestion des notes** - Création d'évaluations, saisie de notes, calcul automatique des moyennes
-  **Gestion des présences** - Appel en classe, suivi des absences et retards
-  **Structure scolaire** - Gestion des classes, matières, années scolaires
-  **Dashboards personnalisés** - Interface adaptée à chaque rôle
-  **Sécurité avancée** - Authentification 2FA, policies Laravel, validation complète
-  **Interface moderne** - UI responsive avec TailwindCSS et shadcn/ui
-  **Mode sombre** - Support du thème clair/sombre

### État du projet

Le projet est actuellement en **phase de développement MVP** (v1.0.0).

- ✅ Authentification complète (login, register, 2FA, reset password)
- ✅ Gestion du profil utilisateur et paramètres
- ✅ Système de rôles et permissions
- 🚧 En cours : Modules de gestion des notes et présences
- 📋 Voir [MVP.md](MVP.md) pour le scope complet du MVP
- 📋 Voir [TODO.md](TODO.md) pour les fonctionnalités futures
- 📋 Voir [ISSUES.md](ISSUES.md) pour les issues détaillées

---

##  Technologies

### Backend
- **Laravel 12** - Framework PHP moderne
- **PostgreSQL** - Base de données relationnelle
- **Laravel Fortify** - Authentification et 2FA
- **Inertia.js** - Pont entre Laravel et React

### Frontend
- **React 19** - Bibliothèque UI avec React Compiler
- **TypeScript** - Typage statique
- **TailwindCSS 4** - Framework CSS utility-first
- **shadcn/ui** - Composants UI modernes
- **Radix UI** - Composants accessibles
- **Vite 7** - Build tool ultra-rapide

### Outils de développement
- **Laravel Pint** - Formatage PHP
- **ESLint & Prettier** - Linting et formatage JS/TS
- **PHPUnit** - Tests backend
- **Playwright** - Tests E2E (à venir)

---

## Installation

### Prérequis

- PHP >= 8.2
- Composer
- Node.js >= 18
- PostgreSQL >= 13
- npm

### Étapes d'installation

1. **Cloner le repository**

```bash
git clone https://github.com/votre-org/nexschool.git
cd nexschool
```

2. **Installer les dépendances**

```bash
# Backend
composer install

# Frontend
npm install
```

3. **Configuration de l'environnement**

```bash
# Copier le fichier d'environnement
cp .env.example .env

# Générer la clé d'application
php artisan key:generate
```

4. **Configurer la base de données**

Éditez le fichier `.env` avec vos informations de base de données :

```env
DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=Nexschool
DB_USERNAME=postgres
DB_PASSWORD=votre_mot_de_passe
```

5. **Exécuter les migrations et seeders**

```bash
# Créer les tables
php artisan migrate

# Peupler avec des données de test (optionnel)
php artisan db:seed
```

6. **Compiler les assets**

```bash
# Développement (avec hot reload)
npm run dev
ou
composer run dev

# Production
npm run build
```

7. **Démarrer le serveur**

```bash
# Serveur de développement Laravel
php artisan serve
```

L'application sera accessible à `http://localhost:8000` ou `http://127.0.0.1:8000/` (Conseiller)

### Comptes de test

Si vous avez exécuté les seeders, vous pouvez vous connecter avec :

- **Admin** : `admin@nexschool.test` / `password`
- **Enseignant** : `teacher@nexschool.test` / `password`
- **Élève** : `student@nexschool.test` / `password`
- **Parent** : `parent@nexschool.test` / `password`

---

## 🛠️ Développement

### Scripts disponibles

```bash
# Backend
composer test              # Exécuter les tests PHPUnit
./vendor/bin/pint         # Formater le code PHP

# Frontend
npm run dev               # Serveur de développement
npm run build             # Build de production
npm run lint              # Linter ESLint
npm run format            # Formater avec Prettier
npm run types             # Vérifier les types TypeScript

# Développement complet (serveur + queue + vite)
composer dev              # Lance tous les serveurs en parallèle
```

### Structure du projet

```
NexSchool/
├── app/                    # Code Laravel (Backend)
│   ├── Http/              # Controllers, Middleware, Requests
│   ├── Models/            # Modèles Eloquent
│   ├── Policies/          # Policies d'autorisation
│   └── Services/          # Services métier
├── resources/             # Frontend
│   ├── js/
│   │   ├── components/    # Composants React
│   │   ├── pages/         # Pages Inertia
│   │   └── layouts/       # Layouts
│   └── css/               # Styles
├── routes/                # Routes de l'application
├── database/
│   ├── migrations/        # Migrations
│   └── seeders/           # Seeders
├── tests/                 # Tests
│   ├── Feature/           # Tests fonctionnels
│   └── Unit/              # Tests unitaires
├── docs/                  # Documentation
├── MVP.md                 # Scope du MVP
├── TODO.md                # Fonctionnalités complètes
├── ISSUES.md              # Issues détaillées
└── CONTRIBUTING.md        # Guide de contribution
```

---

## Contribution

Les contributions sont les bienvenues ! Consultez [CONTRIBUTING.md](CONTRIBUTING.md) pour savoir comment contribuer.

### Comment contribuer ?

1. Fork le projet
2. Créez une branche (`git checkout -b feature/amazing-feature`)
3. Committez vos changements (`git commit -m 'feat: add amazing feature'`)
4. Poussez vers la branche (`git push origin feature/amazing-feature`)
5. Ouvrez une Pull Request

### Recherche de contributeurs

Nous recherchons activement des contributeurs pour :

- 🐛 Tester et reporter des bugs
- 💻 Développer de nouvelles fonctionnalités
- 📝 Améliorer la documentation
- 🎨 Améliorer l'UI/UX
- 🌍 Traduire l'application

Consultez les issues avec le label [`good first issue`](https://github.com/votre-org/nexschool/labels/good%20first%20issue) pour débuter.

---

## Documentation

- [Guide de contribution](CONTRIBUTING.md)
- [Fonctionnalités MVP](MVP.md)
- [Roadmap complète](TODO.md)
- [Issues détaillées](ISSUES.md)
- [Documentation API](docs/api/) (à venir)

---

## Tests

```bash
# Tous les tests
php artisan test

# Tests avec couverture
php artisan test --coverage

# Tests spécifiques
php artisan test --filter GradeManagementTest
```

---

## License

Ce projet est sous licence [MIT](LICENSE).

---

## Équipe & Contributeurs

- **Créateur & Lead Developer** : [Jules MUKADI](https://mukadi.vercel.app/)
- **Contributeurs** : Voir [CONTRIBUTORS.md](CONTRIBUTORS.md)

---

## 🙏 Remerciements

Ce projet utilise les technologies et bibliothèques open-source suivantes :

- [Laravel](https://laravel.com) - Framework PHP
- [React](https://react.dev) - Bibliothèque UI
- [Inertia.js](https://inertiajs.com) - Pont Laravel-React
- [TailwindCSS](https://tailwindcss.com) - Framework CSS
- [shadcn/ui](https://ui.shadcn.com) - Composants UI
- Et bien d'autres...

---

## Support & Contact

- 🐛 **Issues** : [GitHub Issues](https://github.com/votre-org/nexschool/issues)
- 💬 **Discussions** : [GitHub Discussions](https://github.com/votre-org/nexschool/discussions)
- 📧 **Email** : julesmukadi.dev@gmail.com

---

## 🗺️ Roadmap

### Version 1.0 (MVP) -  2026
- ✅ Authentification et gestion des utilisateurs
- 🚧 Gestion des notes et évaluations
- 🚧 Gestion des présences
- 🚧 Dashboards par rôle

### Version 1.1 -  2026
- 📅 Emploi du temps
- 💬 Messagerie interne
- 📄 Génération de bulletins PDF

### Version 1.2 -  2026
- 📚 Ressources pédagogiques
- 📊 Statistiques avancées
- 📱 Application mobile (PWA)

Voir [TODO.md](TODO.md) pour la roadmap complète.

---

<p align="center">
  Fait avec ❤️ pour l'éducation
</p>
