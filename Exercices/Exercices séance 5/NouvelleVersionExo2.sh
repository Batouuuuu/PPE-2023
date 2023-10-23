#!/bin/bash

#créer un script pour établir le classement des lieux les plus cités.
#prendre en argument l’année, le mois et le nombre de lieux à afficher
#accepter * pour l’année et le mois.


# Vérification des arguments passés grace à -ne et $#
if [ $# -ne 3 ]
then
    echo "Il y'a le bon nombre d'argument, c'est à dire 3"
    exit
fi

ANNEE="$1"
MOIS="$2"
NOMBRE_RESULTATS="$3"


if [[ "$ANNEE" =~ ^20(16|17|18) ]]
then
    # Vérification du mois on prend en compte le joker en le despecialisant avec des guillemets de plus la condition if comporte l'opérateur logique || "ou"
    if [[ "$MOIS" =~ ^(0[1-9]|1[0-2]) || "$MOIS" == "*" ]]
    then
        FICHIER="/home/batou/Documents/M1 TAL/Programmation et projets encadrés/Travail perso/PPE-2023/Manip fichiers/ANN/$ANNEE/$MOIS/*.ann"

        # Affichage du classement des lieux les plus cités
        RESULTAT=$(cat $FICHIER | grep Location | cut -f3 | sort | uniq -c | sort -nr | head -n $NOMBRE_RESULTATS)
        echo "$RESULTAT"
    else
        echo "Le mois n'est pas valide."
    fi
else
    echo "L'année n'est pas valide."
fi
