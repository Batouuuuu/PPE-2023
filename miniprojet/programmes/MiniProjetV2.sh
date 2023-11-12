#!/usr/bin/env bash

if [[ $# -ne 1 ]];
then
	echo "On veut exactement un argument au script."
	exit
fi

URLS=$1

if [ ! -f $URLS ]
then
	echo "On attend un fichier, pas un dossier"
	exit
fi
echo "<html>
<head>
<meta charset="UTF-8" />
</head>
<body>
<h1> Résultats des URLS dans un tableau</h1>
<table>
<tr><th>INDEX</th><th>URLS</th><th>Code serveur</th><th>Encodage</th></tr>" >../tableaux/tableau-fr.html  ##le premier sera un chevron simple car cela permet de supprimer le contenu qui est déja écrit sur cette page et éviter la surécriture
lineno=1
while read -r URL
do
	response=$(curl -s -I -L -w "%{http_code}" -o /dev/null $URL) 
	encoding=$(curl -s -I -L -w "%{content_type}" -o /dev/null $URL | grep -P -o "charset=\S+" | cut -d"=" -f2 | tail -n 1) 
	echo -e "$lineno\t$URL\t$response\t$encoding"
	lineno=$(expr $lineno + 1)

	echo "    
	    <tr>
            <td>$lineno</td>
            <td>$URL</td>
            <td>$response</td>
            <td>$encoding</td>
        </tr>" >>../tableaux/tableau-fr.html
done < "$URLS" 

echo "</table>
</body>
	</html>" >>../tableaux/tableau-fr.html
