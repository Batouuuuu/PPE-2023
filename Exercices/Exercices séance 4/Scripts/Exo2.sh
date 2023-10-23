#!/bin/bash

#créer un script pour établir le classement des lieux les plus cités.
#prendre en argument l’année, le mois et le nombre de lieux à afficher
#accepter * pour l’année et le mois.



ANNEE=$1
MOIS=$2
NOMBRE_RESULTATS=$3

FICHIER="/home/batou/Documents/M1\ TAL/Programmation\ et\ projets\ encadrés/Travail\ perso/PPE-2023/Manip\ fichiers/ANN/$ANNE/$MOIS/*.ann"




RESULTAT=$(cat $FICHIER | grep Location | cut -f3 | sort | uniq -c | sort -nr | head -n$NOMBRE_RESULTATS)

echo "$RESULTAT"


