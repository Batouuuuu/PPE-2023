#!/usr/bin/env bash

# cat candide.txt | while read -r mot
# do
#     echo -e "$mot\n"
# done > mots.txt

chemin=$1

if [ -z "$chemin" ]
then
    echo "Vous n'avez pas saisi de chemin en argument"
else
    echo "Opération réussie"
    echo "voila le rendu :" > mots.txt
    grep -o "[a-zA-Z0-9]*" "$chemin" | tr 'A-Z' 'a-z' | tr -d ".,;:'" >> mots.txt   ##il faut doublé le chevrons sinon cela effacera voila le rendu

fi

