#!/usr/bin/env bash


echo "$1"
if [ $# -ne 1 ]
then
	echo "Il manque un argument"
	exit
else
	if [ -f $1 ]
	then
		echo "on a bien le fichier"
	else
		echo "on attend un fichier qui existe"
		exit
	fi
fi

CHEMIN=$1    ##si toutes les conditions sont respectées chemin va être égale au premier argument du script

numeroLigne=1
while read -r line;
do
	http=$(curl -I -L "$line")
	encodage=$(curl -I -L "$line" | grep -o "charset=[a-zA-Z0-9]*-[0-9]*")   ## il faut préciser où doit chercher le grep c'est pour ça que j'ai réecrit le curl line et aussi petit rappel grep -o permet de recupp que
	## l'élement qu'on cherche sinon il retourne toute la ligne
	if [ -z "$encodage" ]
	then
		echo "La page ne précise pas son encodage"
		encodage="NULL"
	else
		echo "La page a comme encodage $encodage"
	fi
	echo -e "${numeroLigne}\t${line}\t${encodage}\t${http}";      ## Il faut mettre encodage avant http car sinon encodage s'affiche après le travail fait par la variable http et ce n'est pas très lisible
	numeroLigne=$(expr $numeroLigne + 1)
done < "$CHEMIN"



