# Projet de Création d'un Cluster Hadoop sur GCP avec Dataproc

## Objectifs
L'objectif de ce projet est de réaliser une analyse de données en mettant en pratique nos connaissances sur la plateforme Hadoop. Ce projet nous permet d'exploiter les concepts et technologies de Hadoop pour traiter et analyser un dataset portant sur l'histoire olympique.

## Architecture Distribuée
Nous avons mis en place une architecture distribuée en utilisant Google Cloud Platform (GCP) et le service Dataproc pour créer et gérer notre cluster Hadoop. Cette configuration permet d'assurer un environnement optimal pour le traitement de données massives.

## Cluster Hadoop sur GCP avec Dataproc
Nous avons configuré un cluster Hadoop sur GCP via Dataproc, utilisant les crédits de l'essai gratuit de 300$ fournis par GCP, couvrant ainsi les coûts liés au projet.

## Configuration du Cluster

### 1. Description
Notre cluster Hadoop est composé :
- d’une **machine maître** avec :
  - 2 cœurs de CPU
  - 16 Go de RAM
  - 300 Go de stockage
- de **deux machines esclaves**, chacune dotée de :
  - 1 cœur de CPU
  - 8 Go de RAM
  - 300 Go de stockage

### 2. Choix de Configuration
La configuration a été choisie pour offrir un équilibre entre la puissance de calcul et la capacité de stockage. La machine maître est responsable de la coordination des tâches, tandis que les machines esclaves se concentrent sur l'exécution parallèle des processus.

### 3. Étapes de Création du Cluster
Les étapes de création du cluster incluent :
1. **Création d’un Compte GCP** : Ouverture d’un compte GCP et activation de l’essai gratuit.
2. **Accès à la Console GCP** : Navigation dans la console GCP pour accéder à Dataproc.
3. **Configuration des Paramètres** : Réglage des paramètres pour le cluster dans Dataproc.
4. **Validation et Lancement** : Vérification des configurations et lancement du cluster.
5. **Suivi du Statut** : Surveillance de l'état du cluster via la console GCP.

Le cluster créé avec Dataproc offre une plateforme robuste et flexible, adaptée aux besoins spécifiques de ce projet de traitement de données distribuées.

## Analyse de Données avec Hive
Pour le traitement et l'analyse des données, Hive a été utilisé pour structurer et interroger le dataset sur l’histoire olympique. Cette approche permet de traiter efficacement de grandes quantités de données dans l'environnement Hadoop.
