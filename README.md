# The Big Project - The MVC version

## 1. Introduction

Bienvenue dans "The Big Project", une application Ruby conçue pour explorer l'architecture MVC. Cette application vous permettra de gérer des potins en les enregistrant dans un fichier CSV, d'afficher une liste de potins et de supprimer ceux qui ne sont plus pertinents.

## 2. Le projet

### 2.1. Décomposer le programme

Le programme est structuré autour de quatre grandes parties, chacune correspondant à une classe :

- **Le routeur** : Gère les interactions avec l'utilisateur et redirige vers les actions appropriées.
- **Le controller** : Relaie les actions de l'utilisateur vers le modèle et retourne les résultats à la vue.
- **La view** : Affiche les informations à l'utilisateur via le terminal.
- **Le modèle et la base de données (model)** : Stocke les potins dans un fichier CSV.

### 2.2. Architecture du programme

L'arborescence du projet sera organisée comme suit :

```
.
├── lib
│   ├── controller.rb
│   ├── gossip.rb
│   ├── router.rb
│   └── view.rb
├── db
│   └── gossip.csv
├── app.rb
├── Gemfile
└── Gemfile.lock
```

### 2.3. Utilisation

Pour utiliser l'application :

1. Assurez-vous d'avoir Ruby installé sur votre machine.
2. Clonez ce repository et accédez-y depuis votre terminal.
3. Installez les gems nécessaires en exécutant `bundle install`.
4. Lancez l'application en exécutant `ruby app.rb`.

L'application affichera un menu dans le terminal vous permettant de créer un potin, afficher tous les potins ou quitter l'application.
