
					GIT II mise en pratique 


Exercice 1 : Annuler un git erroné

*Git add journal de bord.md 
git commit -m  « I AM ERROR »
git status = indiqué que nous sommes en avance par rapport à la version en ligne (car j’ai oublié de préciser mais toutes cces modifications sont faites en local)
Ensuite il fallait reproduire cette manip sur GitHub et après on push sur GitHut. Après on git push sauf qu’un gros problème de conflit rentre en jeu entre le travail fait en ligne et celui fait en local.	
Pour observer ce changement il faut faire git fetch et ensuite git status qui nous indique qu’un changement a eu lieu en local et en ligne.

La solution est de faire git log récuppèrer l’identifiant SHA de l’erreur et on fait git reset HEAD~1.
On fait git pull mais il y a toujours un problème donc deux solutions s’offrent à nous : git reset –hard HEAD ce qui supprime la version qui pose problème.



