#!/usr/bin/env bash

## Ce programme demande quel script on souhaite exécuter en argument ainsi que le fichier et le nombre de mots
## ATTENTION Il est important de donner deux arguments dans le script


##iL NE faut ne pas appeler le script dans un argument attention c'est inutile faire Exo1.sh
script="$1"
fichier="$2"
nombreMots="$3"

if [ -z "$nombreMots" ]
then
    echo "Vous n'avez pas donnez le nombre de mots que vous souhaitiez afficher donc par défaut cela affichera 25 mots"
    nombreMots=25
fi



if [ -z "$script" ] || [ -z "$fichier" ]
then
    echo "Ce programme appelle un script et un fichier, mais vous n'avez pas indiqué lesquels"
else
    bash "$script" "$fichier"   ## il faudrait mettre Exo1.sh ici

fi

grep "[a-zA-Z0-9]*" mots.txt | sort | uniq -c | sort -nr | head -n $nombreMots > motsTrie.txt         ##Attention il faut bien préciser le document sur lequel on effectue le grep ici ça se sera mot.txt
echo "Opération réussie allez voir le fichiermotsTrie, il devrait faire son trie sur les $nombreMots mots les plus fréquents"

