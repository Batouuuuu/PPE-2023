#!/bin/bash


echo "Pour l'année 2016 :"
cat /home/batou/Documents/M1\ TAL/Programmation\ et\ projets\ encadrés/Travail\ perso/PPE-2023/Manip\ fichiers/ANN/2016/*/*.ann | grep Location | uniq -c

echo "Pour l'année 2017 :"
cat /home/batou/Documents/M1\ TAL/Programmation\ et\ projets\ encadrés/Travail\ perso/PPE-2023/Manip\ fichiers/ANN/2017/*/*.ann | grep Location | uniq -c

echo "Pour l'année 2017 :"
cat /home/batou/Documents/M1\ TAL/Programmation\ et\ projets\ encadrés/Travail\ perso/PPE-2023/Manip\ fichiers/ANN/2017/*/*.ann | grep Location | uniq -c

#Il est possible de se simplifier le travail en faisant une boucle en définissant une variable $annee
# for annee in {2016..2018}; do
#     echo "Pour l'année $annee :"
#     cat /home/batou/Documents/M1\ TAL/Programmation\ et\ projets\ encadrés/Travail\ perso/PPE-2023/Manip\ fichiers/ANN/$annee/*/*.ann | grep Location | uniq -c
# done
#
# chmod +x premier_script.sh



chmod +x premier_script.sh
