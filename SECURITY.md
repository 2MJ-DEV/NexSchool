# Politique de sécurité

## Versions supportées

Nous prenons la sécurité de NexSchool très au sérieux. Voici les versions actuellement supportées avec des mises à jour de sécurité :

| Version | Supportée          |
| ------- | ------------------ |
| 1.x     | :white_check_mark: |
| < 1.0   | :x:                |

## Signaler une vulnérabilité

Si vous découvrez une vulnérabilité de sécurité dans NexSchool, nous vous demandons de nous la signaler de manière responsable.

###  NE PAS créer d'issue publique

**Pour des raisons de sécurité, veuillez NE PAS signaler les vulnérabilités via les issues publiques GitHub.**

### Signalement privé

Veuillez envoyer un email à **julesmukadi.dev@gmail.com** avec :

- Une description détaillée de la vulnérabilité
- Les étapes pour reproduire le problème
- L'impact potentiel de la vulnérabilité
- Toute suggestion de correctif si vous en avez

Vous pouvez également utiliser le système de [Security Advisories](https://github.com/2MJ-DEV/nexschool/security/advisories/new) de GitHub pour signaler des vulnérabilités de manière privée.

### Délai de réponse

Nous nous engageons à :

- Accuser réception de votre rapport sous **48 heures**
- Vous tenir informé de l'avancement sous **7 jours**
- Publier un correctif dès que possible (généralement sous **30 jours** pour les vulnérabilités critiques)

### Ce qui constitue une vulnérabilité

Les rapports de sécurité devraient concerner :

- ✅ Injection SQL
- ✅ Cross-Site Scripting (XSS)
- ✅ Cross-Site Request Forgery (CSRF)
- ✅ Authentification et autorisation cassées
- ✅ Exposition de données sensibles
- ✅ Mauvaise configuration de sécurité
- ✅ Utilisation de composants vulnérables
- ✅ Désérialisation non sécurisée
- ✅ Logging et monitoring insuffisants

### ❌ Ce qui NE constitue PAS une vulnérabilité

- Absence de best practices (sans impact sécuritaire)
- Bugs qui ne présentent pas de risque de sécurité
- Problèmes nécessitant l'accès physique à la machine
- Social engineering

##  Bonnes pratiques de sécurité

### Pour les administrateurs

1. **Mots de passe forts**
   - Utilisez des mots de passe d'au moins 12 caractères
   - Activez l'authentification à deux facteurs (2FA)
   - Changez les mots de passe par défaut

2. **Mises à jour**
   - Maintenez NexSchool à jour
   - Appliquez les correctifs de sécurité rapidement
   - Surveillez les dépendances (Composer, npm)

3. **Configuration**
   - Utilisez HTTPS en production
   - Désactivez le mode debug en production
   - Configurez correctement les permissions des fichiers
   - Limitez les tentatives de connexion

4. **Base de données**
   - Utilisez des mots de passe forts pour la base de données
   - Limitez les privilèges de l'utilisateur de la base de données
   - Effectuez des sauvegardes régulières

5. **Serveur**
   - Gardez le système d'exploitation à jour
   - Utilisez un firewall
   - Configurez fail2ban ou équivalent
   - Surveillez les logs

### Pour les développeurs

1. **Code**
   - Validez toutes les entrées utilisateur
   - Utilisez les requêtes préparées (Eloquent le fait automatiquement)
   - Échappez les sorties (Blade et React le font automatiquement)
   - N'exposez jamais de secrets dans le code

2. **Authentification**
   - Utilisez les fonctionnalités de Laravel (Hash, Auth)
   - Implémentez le rate limiting
   - Vérifiez toujours les autorisations (Policies)

3. **Dépendances**
   - Auditez régulièrement les dépendances
   - `composer audit` pour les dépendances PHP
   - `npm audit` pour les dépendances JavaScript
   - Mettez à jour les dépendances vulnérables

4. **Tests**
   - Écrivez des tests de sécurité
   - Testez les permissions et autorisations
   - Testez la validation des entrées

## Mesures de sécurité implémentées

NexSchool implémente plusieurs mesures de sécurité :

### Backend (Laravel)

- ✅ Protection CSRF automatique
- ✅ Protection contre l'injection SQL (Eloquent ORM)
- ✅ Hachage sécurisé des mots de passe (bcrypt)
- ✅ Authentification à deux facteurs (2FA)
- ✅ Rate limiting sur les routes sensibles
- ✅ Validation des entrées avec Form Requests
- ✅ Policies pour les autorisations
- ✅ Middleware de vérification des rôles
- ✅ Sessions sécurisées
- ✅ Cookies HTTP-only

### Frontend (React)

- ✅ Échappement automatique des sorties
- ✅ Content Security Policy (CSP) compatible
- ✅ Validation côté client
- ✅ Sanitization des inputs
- ✅ Protection XSS

### Infrastructure

- ✅ HTTPS requis en production
- ✅ Headers de sécurité (X-Frame-Options, X-Content-Type-Options, etc.)
- ✅ Logs des activités sensibles
- ✅ Vérification de l'intégrité des fichiers

## Checklist de sécurité pour le déploiement

Avant de déployer en production, assurez-vous de :

- [ ] `APP_DEBUG=false` dans `.env`
- [ ] `APP_ENV=production` dans `.env`
- [ ] Clé d'application générée (`APP_KEY`)
- [ ] HTTPS configuré avec certificat valide
- [ ] Mot de passe base de données fort et unique
- [ ] Permissions des fichiers correctes (755 pour les dossiers, 644 pour les fichiers)
- [ ] `/storage` et `/bootstrap/cache` accessibles en écriture
- [ ] `.env` non accessible publiquement
- [ ] Rate limiting configuré
- [ ] Logs configurés et surveillés
- [ ] Sauvegardes automatiques configurées
- [ ] Monitoring et alertes configurés
- [ ] 2FA activé pour les comptes administrateurs

## Audits de sécurité

Nous effectuons régulièrement des audits de sécurité :

- Audit automatique des dépendances (hebdomadaire)
- Revue de code avec focus sécurité
- Tests de pénétration (avant chaque release majeure)
- Analyse statique du code (SAST)

## Historique des vulnérabilités

Aucune vulnérabilité n'a encore été signalée pour le moment.

Les vulnérabilités passées et leurs correctifs seront listés ici lorsqu'applicables.

## Reconnaissance

Nous reconnaissons et remercions publiquement (avec votre accord) tous les chercheurs en sécurité qui nous signalent des vulnérabilités de manière responsable.

### Hall of Fame

<a href="https://github.com/2MJ-DEV/NexSchool/graphs/contributors">
  <img src="https://contrib.rocks/image?repo=2MJ-DEV/NexSchool" />
</a>

## Ressources

- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [Laravel Security Best Practices](https://laravel.com/docs/security)
- [OWASP Cheat Sheet Series](https://cheatsheetseries.owasp.org/)

## Contact

Pour toute question concernant la sécurité :

- Email : security@nexschool.test
- GitHub Security Advisories : [Signaler une vulnérabilité](https://github.com/2MJ-DEV/nexschool/security/advisories/new)

---

**Dernière mise à jour** : 17 janvier 2026
