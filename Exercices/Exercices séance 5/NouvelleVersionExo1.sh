#!/bin/bash/

if [ -n $1 ]
then
    ANNEE=$1
    REP=$2
    if [[ "$ANNEE" =~ ^20(16|17|18) ]]
    then
        FICHIER="$REP/$ANNEE/*/*.ann"


        # Compter et afficher les entités avec uniq -c
        cat "$FICHIER" | uniq -c

        # Compter le nombre total d'entités avec wc -l
        NB_ENTITE=$(cat "$FICHIER" | uniq -c | wc -l)

        echo "Nombre total d'entités pour l'année $ANNEE : $NB_ENTITE"
    else
        echo "L'année rentrée n'est pas valide. Utilisez une année entre 2016 et 2018."
    fi
else
    echo "L'argument de l'année est vide. Rentrez une année soit 2016, 2017 ou 2018"
fi

echo "Fin du programme"

