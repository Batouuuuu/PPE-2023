#Journal de bord du projet encadré 

COURS du 20/09 

TOUT EST FICHIER !

Découverte des bases du langage Bash avec syntaxe de commande : mkdir (créer un répertoire, cd (change de répertoire), ls (liste les répertoires), pwd (affiche où l'on est) 

Différence chemin absolu et relatif 





NB : Répertoire différent de fichier (le répertoire contient des fichiers)

- Utilisation des caractères jokers pour pouvoir déplacer tout un ensemble de fichier dans un répertoire (ex : mv *.text Dowloads = bouge tous les fichiers txt dans le repertoire downloads)


Exercice  2.a)

J'ai ensuite cloné mon répertoire github afin de le synchronisé sur mon ordinateur grâce à la commande : >> git clone "https://github.com/Batouuuuu/PPE-2023/"

2.b) Pour vérifier que mon répertoire n'est pas en retard par rapport à celui édité en ligne je peux utiliser la commande : >>git status

et j'utilise >> git pull, afin de récuppérer les dossiers mis à jours sous github


## Exercice de manipulation des dossiers sous bash 

Nous déplaçons les fichiers dans des répertoires créer au préalable (mkdir…) et grâce aux caractères jokers nous pouvons spécifier les fichiers à déplacer 
ex : >> mv 2016_02* ../2016/02 et on réalise le même principe pour les jpg, les ann...   

N.B : le travail était assez rébarbatif peut-etre existe t’il un moyen plus rapide pour automatiser le rangement de tous ces docs





Afin de synchroniser avec les modifications il faut faire: 

>>git fetch → git status (permet de voir si on est en retard) → git pull 


PROBLEMES RENCONTRES ET RESOLUS :

-Problèmes utilisateur inconnu :
Au début lorsque je voulais pull le dossier qui est sur GitHUb cela m’indiquait que l’utilisateur n’était pas connu ‘who are you’. J’ai du configuré mon username: git config --global user.name "Votre Nom" et mon mail : git config --global user.email "votre@email.com"

Problème pour push ver GitHub :
J’ai essayé de push mon journal de bord depuis le dossier local vers le dossier synchro GitHub. Mais cela me demandais un nom d’utilisateur et un mot de passe. Apparemment les mots de passe pour lié au bash n’existe plus depuis 2021, j’ai donc généré un jeton afin de pouvoir le mettre à la place du mot de passe demandé et les push fonctionnent.

Problème pour push correctement un fichier spécifique :
Je ne voulais que push le journal or celui-ci se trouve dans un répertoire ou on retrouve un README.Il faut utiliser git add journal.md afin de bien prendre en compte les modifs >> git commit -m «message du commit». 
Créer un tag >>git tag -a -m "Cette fois c'est la bonne" testTAg
On push sur la branche main >> git push origin main
On push le tag >> git push origin testTAg.


Résumé :

Récupérer les modifs sur github :  git fetch → git status → git pull 

Push les modifs sur github : git add doc.txt → git commit -m «message» → git tag -a -m "Cette fois c'est la bonne" <tag>→ git push origin main → git push origin <tag> 




3eme séance


Pendant la 3eme séance nous avons vu comment annuler les changements qui ont été commit seulement dans les exercices j’ai eu un peu de mal à suivre et à comprendr. Il faut absolument que je retravaille et pose des questions au prochain TD. L’exercice 2 du TD de cette séance me pose problème. LE fichier oups a été supprimé avec git rm oups.md.
Nous avons appris l’utilité de l’identifiant SHA qui permet de cibler un commit précis et comment supprimer un commit grace à git reset HEAD~ qui revient à l’étape avant le git commit. Git reset soft HEAD~ qui revient avant le commit cependant tous les fichiers restent on peut juste rajouter le fichier qui manque. Attention ces opérations s’effectuent avant le push vers le GitHub en ligne



Annuler un git erroné

*Git add journal de bord.md 
git commit -m  « I AM ERROR »
git status = indiqué que nous sommes en avance par rapport à la version en ligne (car j’ai oublié de préciser mais toutes cces modifications sont faites en local)
Ensuite il fallait reproduire cette manip sur GitHub et après on push sur GitHut. Après on git push sauf qu’un gros problème de conflit rentre en jeu entre le travail fait en ligne et celui fait en local.	
Pour observer ce changement il faut faire git fetch et ensuite git status qui nous indique qu’un changement a eu lieu en local et en ligne.

La solution est de faire git log récuppèrer l’identifiant SHA de l’erreur et on fait git reset HEAD~1.
On fait git pull mais il y a toujours un problème donc deux solutions s’offrent à nous : git reset –hard HEAD ce qui supprime la version qui pose problème.


4eme séance 11/10

Dans cette séance nous avons appris de nouvelles notions de commandes Unix comme les pipelines ou encore les scripts

Pour ce qui est des pipelines elles servent à communiquer entre différents programme par le biais de "pipe : | "
Par exemple si je souhaite que mon retrouver toutes les fois où un mot se trouve dans un programme :
cat exemple.txt | grep --color université | wc -l (le -l permet de n'afficher que le compte des lignes) Ps: wc -l doit être placé en dernier car c'est la sortie


Pour les exercices sur les pipelines voilà ce qu'il faut retenir :

Différence entre > et >> le premier écrit en supprimant dans le doc et l'autre écrit à la fin du doc   soit cat text.txt | grep Location | wc -l >>/home/batou/output.txt
echo permet d'écrire dans un doc ex : echo "J'aime le chocolat : " >> /home/batou/output.txt
Nous avons vu sort qui permet de classer par ordre alphabétique si on lui rajoute -nr cela trie dans l'autre sens, uniq -c qui permet de compter les occurences, head -n20 permet de n'afficher que 20 résultats,
cut -f3 coupe et ne garde que la 3ème colonne (dans le cas où les docs est un classeur)

ex de commande : >>cat */*/*.ann | grep -o '[0-9]\+ décembre [0-9]\+' | sort | uniq -c | head -n20 | sort -nr >>/home/batou/output.txt


Pour les exercices sur les scripts :

Difficultés : Je ne suis pas sûr de comprendre ce qui est vraiment attendu dans ces exos, la différence entre entité et type d'entité
De plus, je ne parviens plus à préciser le chemin absolu d'un document je ne parviens pas à lancer mes nouveaux scripts.
Pour les exercices, je n'ai pas cherché à faire de boucle et ai appelé bêtement 3 fois les script où il fallait l'appeler 3 fois.

Ce que je retiens est que le script doit commencer par un shebang #!bin/bash 


5eme séance 18/10

Lors de mes derniers test je disais que le script doit se terminer par chmod +x nom_du_script.sh. Mais non cela est une façon de rendre mon script exécutable dans le terminal 
Je dois faire chmod +x NomDuScript pour donner la permission et le rendre exécutable.
Ensuite en me mettant dans le terminal à l'endroit où il est et en écrivant ./Exo1.sh 2016. 2016 est ici la variable.

J'ai bien compris comment me servir des instructions conditionnelles pour demander à l'utilisateur de rentrer une variable valide.
Seulement, je ne parviens toujours pas à spécifier le chemin absolu dans ma variable. Il semblerait que les caractères jokers soient mal interprétés.
Par exemple :

FICHIER="/home/batou/Documents/M1 TAL/Programmation et projets encadrés/Travail perso/PPE-2023/Manip fichiers/ANN/$ANNEE/*/*.ann"

Malgré cet inconvénient, je me suis senti plus à l'aise pour faire des scripts que la première fois

-n permet de vérifier qu'une chaine de caractère n'est pas vide
-ne permet de vérifier le nombre d'argument dans une condition if : if [ $# -ne 3 ]


Travail sur le projet

Avec mon groupe constitué de Keming et Marie nous avons commencé à faire la liste des mots qui nous semblaient interessant pour le projet à réaliser. Nous hésitons encore entre plusieurs mots. Nous ne sommes pas certains d’avoir vraiment compris le critère de sélection que nous devions privilégier pour trouver un mot. Le mot doit-il être polysémique par exemple. Nous poserons ces questions à la prochaine séance


6eme séance 25/10

Dans cette séance, nous avons commencé les prémices du script qui nous servira à récuppérer les pages web qui nous interessent. Je conseille de relire le script que j'ai fait il s'intitule miniprojet.sh et se trouve dans
le dossier travail perso.
Dans ce script nous avons appris à gérer les redirections vers d'autres pages webs lorsqu'une requete HTTP nous renvoit le code 300. En effet, seul cette erreur de code peut être travailler car pour 400 et 500
nous ne pourrons rien y faire. Ainsi, il faudra utiliser l'option -L qui prend en compte la redirection. L'option curl -I permet de ne renvoyer que les informations de requete HTTP ce qui est important
car avant de pouvoir extraire une page web nous vérifions le code http qu'elle renvoit et si elle est encodé correctement (on vérifie cela avec une regexp voir code ci-dessus)

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


Pour ce qui est des exercices supplémentaires j'ai eu quelques difficulés pour l'exo 2 en effet je ne parvenait pas à intégrer l'argument de l'exo 1 dans l'exo2 càd. Je lance l'execution de mon script exo2 comme ça :
./Exo2.sh ./Exo1.sh candide.txt (le problème est que le script exo n'arrivait pas à comprendre mon argument candide qui correspond pourtant au chemin d'accès pour lui) J'ai donc défini 2 arguments au script 2
script et fichier je ne comprends toujours pas pourquoi mon ancienne méthode n'a pas marché pourtant logiquement ça devrait fonctionner.
Il faut que je me souvienne de poser la question en cours. (mon ancien script pour l'exo2 et 1 sont collés dans Exercices séance 6 > Exercices.txt)

Après avoir demandé au prof la solution est toute simple je ne sais pas pourquoi (à retester) en gros il suffit juste d'appeler le script exo1.sh mais je crois que ça ne marchait pas à revoir

Je ne parviens pas à faire l'exercice 3 :
Réflexion : Je me servirai du fichier txt mots.txt qui contient tous les mots séparés et je ferais en sorte de paste le mot qui suit avec le mot qui le précède en faisant une boucle for ou while ?
Une autre idée je viens de me renseigner sur le fonctionnement de paste, effectivement cela me sempble plus simple de l'utiliser. Il faudrait que j'arrive à prendre 2 documents et les pastes ensembles.
Un document prendrait un mot sur 2 et l'autre document prendrait l'inverse ensuite en les concaténant avec paste cela permettrait de faire des bigrammes.

En fait l'exercice3 était réussi mais juste les chevrons étaient doublés >> ce qui faisait que les bigrammes étaient écrits à la suite de Candide.txt


Travail sur le projet :

Le travail a avancé nous avons choisi de prendre le mot "devoir" qui nous semble être interessant de par sa polysémie. Nous commençons donc le travail de récuppérage d'url.


Séance 7 : 7/11

Pendant cette séance nous avons corrigé le miniprojet, à partir de maintenant je m'en servirai de base pour la suite du projet, il s'intitule MiniProjetCorige.
La suite du miniprojet est que la sortie soit sous forme de tableau HTML. Ma première idée a été d'ajouter >>tableau.html à chaque itération de la boucle while, sauf qu'en faisant ça cela ne prenait pas en compte
le balisage html. Pour bien le faire il a fallu l'écrire en brut à l'aide d'echos que j'ai écris dans mon fichier >>tableau.html.
A noter que dans mon script la première écriture du balisage est écrite avec un simple chevron >tableau, cela permet de nettoyer ce qui est écrit de base et de ne pas avoir de surécriture dans le fichier html
à chaque fois que celui-ci est lancé.
Par la suite il faudra je pense travailler la mise en page de ce tableau avec du CSS.


Séance 8 : 15/11

J'ai du rajouté dans mon script Miniprojet2 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css"> afin de pouvoir lié correctement bulma. J'ai ensuite créer un fichier css que j'ai lié aussi j'ai essayé de m'amuser un peu dessus. Mais Bulma semble supérieure au class que je définie manuellement dans mon fichier css.
J'ai eu énorement de problème lors de mes push sur git pendant ce projet. J'avais supprimé le doc index.html du root en voulant le placer dans le fichier miniprojet3 avec les autres fichiers css et l'autre page html.
Il a fallu que je remette l'index dans le root et refaire un push pour le dossier miniprojet 3 sans l'index à l'interieur.

Séance 9 : 22/11

J'ai trouvé que c'était sûrment une des meilleures séances le fait de travailler en groupe et de mettre en commun nos idées. J'ai beaucoup appris, j'avais quelques difficulés pour faisantliser le script.
Tout d'abord la puissance de basename !!!!!
OUI basename c'est trop fort, il faut l'utiliser afin de récuppérer le nom de notre fichier.  lang=$(basename $URLS .txt). Par exemple lorsque je lancerai mon script : ./script-fr.sh URLS/fr.txt cela conservera
fr.
Comme dans mes autres documents les pages aspirées sont sous cette formes fr-(numéro).html dump_html=$(curl $URL > "../aspirations/${lang}-${lineno}.html"). A savoir qu'en faisant ça cela il faudra
la mettre dans la boucle while ainsi nous générerons un html (aspiration) pour chaque url.
Même raisonnement pour les dumps mais cette fois il faut utiliser lynx : dump_text=$(lynx -dump $URL > "../dumps-text/${lang}-${lineno}.txt").
On n'oublie pas de mettre un compteur qui va compter notre regexp du mot devoir(s) :compte=$(cat ../dumps-text/${lang}-${lineno}.txt | egrep -o "devoir(s)" -c)
Et le contexte autour du mot : contexte=$(cat ../dumps-text/${lang}-${lineno}.txt | egrep -A 2 -B 2 "devoir(s)" > "../contextes/${lang}-${lineno}.txt")
Nous avons encore quelques difficulés pour aspirer les pages en chinois nous verrons au prochain cours.
A noter qu'il a fallu remettre un dossier index dans notre root.

NB : j'ai fait 2 dossiers un pour m'entrainer avec les différents scripts (Programmation_et_projets_encadres>Travail_perso>Entrainement_pour_le_Projet_Groupe)
et le vrai dossier celui qui est cloné avec le GitHub (Programmation_et_projets_encadres>Groupe-projet-PPE)





