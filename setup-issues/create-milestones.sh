# Creation des milestones restants
gh api repos/:owner/:repo/milestones -f title="Milestone 2 - Structure scolaire" -f description="Structure de base: annees, classes, matieres" -f due_on="2026-02-02T23:59:59Z"
gh api repos/:owner/:repo/milestones -f title="Milestone 3 - Gestion des notes - Enseignants" -f description="Enseignants peuvent creer evaluations et saisir notes" -f due_on="2026-02-09T23:59:59Z"
gh api repos/:owner/:repo/milestones -f title="Milestone 4 - Consultation notes - Eleves et Parents" -f description="Eleves et parents consultent notes et moyennes" -f due_on="2026-02-09T23:59:59Z"
gh api repos/:owner/:repo/milestones -f title="Milestone 5 - Gestion des presences" -f description="Systeme de gestion des presences et absences" -f due_on="2026-02-16T23:59:59Z"
gh api repos/:owner/:repo/milestones -f title="Milestone 6 - Dashboards et navigation" -f description="Dashboards personnalises et navigation amelioree" -f due_on="2026-02-23T23:59:59Z"
gh api repos/:owner/:repo/milestones -f title="Milestone 7 - Permissions et securite" -f description="Securiser l'application et implementer permissions" -f due_on="2026-03-02T23:59:59Z"
gh api repos/:owner/:repo/milestones -f title="Milestone 8 - Polish et finitions" -f description="Finaliser, tester et documenter le MVP" -f due_on="2026-03-02T23:59:59Z"
