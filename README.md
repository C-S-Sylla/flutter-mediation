# Registre des Médiations de Quartier (ODD 16) - Flutter App

## Présentation du Projet
Cette application mobile, développée avec **Flutter**, a pour objectif de digitaliser le registre des médiations au sein d'une commission de quartier au Sénégal. Elle s'inscrit dans le cadre de l'**Objectif de Développement Durable n°16 (Paix, Justice et Institutions Efficaces)**.

L'application permet aux délégués de quartier de recenser les litiges, d'en suivre la résolution et d'obtenir des statistiques en temps réel sur l'apaisement du climat social.

## Fonctionnalités (CRUD & Interaction)
L'application implémente un système complet de gestion de données :
- **Authentification personnalisée** : Écran de connexion sécurisé avec redirection dynamique.
- **Tableau de Bord (Dashboard)** : Calcul en temps réel du taux de résolution des conflits et barre de progression visuelle.
- **CRUD Complet** :
  - **Création** : Formulaire avec validation des champs pour ajouter une médiation.
  - **Lecture** : Liste exhaustive avec recherche dynamique et écran de détails premium.
  - **Mise à jour** : Possibilité de modifier le statut d'un litige (Résolu / En cours) depuis la fiche détaillée.
  - **Suppression** : Suppression d'un enregistrement avec boîte de dialogue de confirmation.
- **Filtrage avancé** : Recherche par mots-clés et filtre rapide sur les dossiers non résolus.

## Concepts Techniques Maîtrisés
Ce projet démontre la maîtrise des notions suivantes :
- **Modélisation Dart** : Usage de classes, Enums, et méthodes de calcul statiques.
- **State Management** : Utilisation optimisée des `StatelessWidget` pour les composants réutilisables et `StatefulWidget` (`setState`) pour l'interactivité.
- **Routage Nommé** : Navigation fluide via `initialRoute` et `routes` avec passage d'arguments complexes entre écrans.
- **UI/UX Design** : Thème personnalisé (Color Palette ODD 16), widgets personnalisés, gestion des états vides (Empty State) et typographie soignée.

## Structure du Projet
```text
lib/
├── models/
│   └── mediation.dart      # Classe modèle et logique métier
├── screens/
│   ├── login_screen.dart   # Authentification
│   ├── list_screen.dart    # Dashboard + Liste + Recherche
│   ├── detail_screen.dart  # Fiche détaillée + Action de modification
│   ├── form_screen.dart    # Création (Validation de formulaire)
│   └── about_screen.dart   # Informations étudiant & Données réelles
├── widgets/
│   └── mediation_card.dart # Widget personnalisé pour les items de la liste
└── main.dart               # Configuration des routes et du thème
```

##  Installation et Lancement
S'assurer d'avoir le SDK Flutter installé.
Cloner le dépôt.
Exécuter les commandes suivantes dans le terminal :
```text
flutter pub get
flutter run
```

## Informations Étudiant
- **Nom**: Cheikh Sadibou Sylla
- **Promotion** : DAR26 (Licence 3)
- **Institution** : ESMT (École Supérieure Multinationale des Télécommunications)
- **Module** : Développement Multiplateforme
- **Date** : Juin 2026