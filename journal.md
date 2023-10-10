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
