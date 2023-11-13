#!/usr/bin/env bash

if [ $# -ne 1 ]
then
    echo "Vous n'avez pas écrit sur quel fichier vous-vouliez travailler"
fi

##Je ne parviens pas à prendre 1 mot sur 2 j'ai donc réflechis à une autre alternative
##Je défini mot et line comme des variables, je fais une boucle while qui va lire tous les mots


mot=""
fichier="$1"


while read -r line
do
    if [ -z "$mot" ]    ##Si le mot est vide alors mot = line permet de que le premier mot soit le 1er mot du doc
    then
        mot="$line"
    else
        bigramme="$mot $line"               ##si le mot n'est pas vide alors la variable bigramme va afficher le mot et le mot qui suit
        echo "$bigramme" >> bigramme.txt  ## J'ai fait une erreur en fait les bigrammes s'écrivent mais j'avais doublé le chevrons ce qui fait que le doc est énorme
        mot="$line"  ##très important il faut terminer notre instruction en n'oubliant pas de donner la valeur mot à line pour pouvoir passer au mot suivant
    fi
done < "$fichier"

