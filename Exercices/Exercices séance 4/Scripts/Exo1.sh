#!/bin/bash

ANNEE=2016
FICHIER="/home/batou/Documents/M1\ TAL/Programmation\ et\ projets\ encadrés/Travail\ perso/PPE-2023/Manip\ fichiers/ANN/$ANNEE/*/*.ann"

# Compter et afficher les entités avec uniq -c
cat "$FICHIER" | uniq -c

# Compter le nombre total d'entités avec wc -l
NB_ENTITE=$(cat "$FICHIER" | uniq -c | wc -l)

echo "Nombre total d'entités pour l'année ANNEE: $NB_ENTITE"


chmod +x Exo1.sh


