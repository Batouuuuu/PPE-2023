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


Séance 10 : 28/11

Séance très dense où l'outil itrameur nous a été présenté.
Nous avons aussi appris ce qu'était un concordancier et comment en intégrer un dans notre script.

Je me suis retrouvé confronté a plusieurs problèmes github lors du travail sur le script avec mon groupe.
L'une des commandes la plus utile est le git reset HEAD~1 qui nous permet de revenir un commit en avant lorsqu'il y a interference entre 2 commits.
- En revanche un problème qui était déjà là lors de la dernière séace c'est le grep qui compte le nombre de mot devoir(s) dans les pages HTML. Je ne comprends pas mais il m'indique 0 occurence sur des pages où le mot
apparait pourtant. Je tacherai de rettravailler cette expression pour la prochaine fois.
- L'autre problème majeur que j'ai rencontré se trouve dans le push sur GitHub. J'ai déjà plusieurs répertoires sur GitHub seulement lorsque je veux push directement le repertoire Groupes-PPE dans lequel se trouve
tous nos fichiers pour le projet. Cela me le push sur un autre repéertoire dans lequel je me suis amusé a codé un jeu. Je n'arrive pas à le push dans le bon repertoire. Je me retrouve du coup à devoir push
tous les fichiers qui ont été modifiés, cela est très contraignant.

Pour ce qui est de l'outil itrameur, je ne suis pas certain d'avoir compris toutes les subtilités de l'outil ou même que nous aillions répondu correctements à certaines questions du TD,
ça a l'air d'être un outil très puissant.
Je suis impatient de travailler sur la mise en page du site et de finaliser ce projet !  nous croulons sous les projets en ce moment, ce n'est pas le moment de lâcher !



Semaine des vacances

Je travaille actuellement sur le site web qui servira à présenter notre travail. N'ayant pas appris à me servir des frameworks, je me sers du css pour essayer de faire un site web convenable.
Cependant je me retrouve confronté à plusieurs problèmes :

1 - Comment faire pour gérer le header et le footer. En effet, ils sont tous les deux codés dans ma page index, mais j'aimerai ne pas avoir à les réecrire sur toutes mes pages à chaque fois.
D'habitude je faisais ça facilement avec du php avec php include once header sur toutes mes pages et cela me mettait mon header. Seulement l'hébergement de site web GitHub ne permet pas d'utiliser du php.
J'ai donc pensé au Javascript mais je ne maitrise pas ce langage j'ai essayé de faire une fonction à l'interieur de laquelle j'utilisais des balises html et j'appelle mon fichier js en début de mon programme mais
cela n'a pas fonctionné. Donc pour l'instant je dois me contenter de tout écrire à chaque fois ce qui n'est pas très pro.

2 - La gestion des images, comme je code tout en css cela pose plusieurs problèmes en fonction de la taille des écrans des utilisateurs pour remédier à ce problème j'utilise des média querry, cepedant c'est assez
compliqué car sur notre page d'index nous faisons superposer une image sur une autre et il est très difficile de leur faire conserver leurs proportions à toutes les deux en fonction de la taille de l'écran.


Afin de rendre notre page disponible dans les langues sur lesquelles nous travaillons j'utilise un outil en open source de google traduction qu'il suffit de lancer avec quelques lignes de js.



CREATION DU SITE WEB 


Voici le journal de groupe où nous avançons. Ce journal a été crée en retard je vous invite à regarder nos journal respectifs si vous voulez voir
Ici, nous nous consacrerons à l'anvancée du site web. Tous les scripts ayant été finis.

Nous avons fait beaucoup de recherches sur les designs des pages webs aujourd'hui et ces dernières se ressemblent et ont des codes que nous respecteront.

--- 01/12/23 ---
Conception du site :

La première chose à faire a été d'élaborer la conception du site comment on l'imaginait. Vu que notre mot est "devoir" le design d'un cahier de devoir pour notre page d'index nous a paru être une évidence.
Nous allons concevoir un header et un footer puisque cela est une norme sur tous les sites web aujourd'hui.

Les informations que nous mettrons dans le header :
- une icone (moyen de retourner sur la page d'index),
- un onglet méthode (qui expliquera pourquoi ce mot, les langues sur lesquelles nous allons travailler), notre hypothèse, l'étymologie du mot...
- un onglet analyse dans lequels on mettra notre analyse itrameur
- Le logo GitHub qui permettra d'accéder à cet endroit

Les informations que nous mettrons dans le footer :
- Qui nous sommes (afin de détailler et donner des informations sur nous)
- Une documentation
- Des logos qui permettent de nous contacter sur facebook, twitter, par mail (cela sera fictif et les redirections seront sur les sites mais nous n'avons pas de page de réseaux social à proprement parlée à donner)
- Gestion des cookies (cela sera fictif, mais l'aspect gestion des cookies est important de nos jours)
- Notre signature



Très peu de frameworks ont été utilisé car j'ai appris à utilisé le css sur mes sites. Nous nous sommes servis de Bulma (pour nos tableaux).

Toutes les pages html sont rangés dans le dossier vue, il y'a le dossier PPE dans lequel on retrouve toutes nos aspirations, nos concordanciers, le dossier css dans lequels toutes les pages css se trouvent.

--- 13/12/23 ---
PAGE INDEX :

- Le premier obstacle auquel nous avons été confronté est l'incorporation du header et du footer dans toutes les pages. En effet lorsque, je développais des sites j'avais pour habitude de coder mon header et mon footer dans un fichier
php ou encore js et de l'appeler dans mes pages html. Malheureusement, je n'ai pas reussi à reproduire cette technique car il semblerait que l'hebergeur github ne prennent pas en charge les fichiers js où php incorporés dans un html.

Le header et le footer n'ont pas posé de difficultés particulière à coder mais du coup ils sont incorporés sur toutes les pages html de façon très rébarbative et pas très agréable à lire.
J'ai découvert également que lorsque l'on écrivait un lien href il était possible de lui mettre l'attribut target='_blank' afin d'ouvrir un nouvel onglet lorsque l'utilisateur clique dessus.
Petit détail également à l'aide d'un href mailto il est possible d'envoyer automatiquement un mail à l'adresse que nous avons renseigné dans le mailto <a href="mailto:projetPPE2023BMK@gmail.com">.


- Autre problème auquel nous avons été confronté est a l'affiche de l'image en effet, nous avions dit que nous voulions un cahier sur notre page index, nous avons eu une autre idée entre temps. Nous voulions que ce cahier soit sur une table.
Il a donc fallu prendre l'image d'une table et superposer le cahier dessus. Jusque là rien de bien méchant puisque nous avons fait en sorte que notre image de cahier soit sur un fond transparent.
Le problème et vous verrez que c'est une problème récurrent est le responsive design. En effet en fonction des différents écran ces images se superposent bizzarement. Ce problème sera traité grâce à des media queries, mais je pense
qu'il aurait été plus facile d'utiliser des frameworks pour ne pas avoir ces problèmes de responsives design.

- Pour les différents logos nous avons juste utiliser ceux que proposer le site FontAwesome :    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">.

- Une nouvelle idée nous aient venue. Nous voulions travaillé plus l'aspect linguistique de notre site en permettant à l'utilisateur que la page soit traduite en fonction de ses préférences. Nous avons donc fait une tentative
d'inclure l'API google traduction via un script js. Cela n'a malheureusement pas fonctionné avec un peu plus de temps nous aurions pu travailler cet aspect.


--- 26/12/23 ---
PAGE ANALYSE :

Cette page est probablement celle qui nous a posé le plus de problèmes.

En effet, pour rendre notre page interactive nous avons voulu mettre des key frames afin de faire des animations.
La partie la plus dure à géré a été

--- 26/12/23 ---
Qui sommes nous : (page dans le footer), une des pages dont nous sommes les plus fiers. Nous avons importé Leaflet (afin d'afficher une map interactive). Je ne sais pas pourquoi il y'a des losanges et que l'affiche se fait sur des ronds, j'ai eu beau regarder la documentation de leaflet je n'ai pas trouvé pourquoi nous avions ce problème d'affichage. J'ai écris un script js que j'ai incorporé dans la page. Pour faire ce script, je me suis servi de la docummentation leaflet https://leafletjs.com/. J'ai mis les points de coordonnées de nos trois universités. Même si l'affichage de la carte n'est parfait nous avons bien aimé la fonctionnalité et avond décidé de la garder.

--- 28/12/23 ---
PAGE TABLEAUX :

Des animations ont aussi été faites pour faire apparaître les tableaux par le biais de key frames. Le css associé est tableaux.css.






