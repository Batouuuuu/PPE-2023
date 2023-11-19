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
    grep -o "[a-zA-Z0-9]*" "$chemin" | tr 'A-Z' 'a-z' | tr -d ".,;:'" >> mots.txt   ##il faut doubler le chevrons sinon cela effacera ce qu'il y'a de base dans mots.txt

fi





############################### CORRECTION du prof
## Site regexp101 pour tester la regexp



#
# if [ ! -f "$1" ]   ##vérifie que l'argument est un fichier dans le if ! = fais la négation (que si $1 n'est pas un fichier)  -f est fichier
# then
#     echo "pas de fichier donné en argument"
#     exit 1
##fi

## FICHIER = "$1"

##cat "$FICHIER" | grep -P -o '\p{latin}+' | tr '[:upper]' '[:lower]' | less

## tr '[:upper]' '[:lower]' | tr 'ÉÀ' 'éà', tr ne fonctionne que sur les caractères ASCII pour y palier on peut tout simplement écrire les caractères qui posent problèmes , converti toutes les lettres majuscules en minuscules
## less permet de parcourir l'interieur du fichier

## différence entre exit 1 et exit (exit suppose qu'il n'y aucune erreur exit 1 c'est pour si on a une erreur, ce sont des conventions)
