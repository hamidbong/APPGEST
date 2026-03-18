#!/bin/bash

ajoutSal()
{
        numSal=$(echo "$1" | cut -d "|" -f1)
        nomSal=$(echo "$1" | cut -d "|" -f2)
	bloc=$(echo "$1" | cut -d "|" -f3)
        id_patt=$(echo "$1" | cut -d "|" -f4)
	ndo="$numSal$nomSal$bloc".txt
        if [ "$ndo" != "" ];
        then
                echo "Numero: $numSal Nom salle: $nomSal Bloc: $bloc Id patient: $id_patt" >> /home/brahbong/appGEst/salle_Gest/$ndo
                if [ -e "/home/brahbong/appGEst/salle_Gest/"$ndo ];
                then
                        echo "salle crée sous salle_Gest sur :$ndo"
                else
                        echo "Salle non ajouté!!"
                fi
        else
		echo "Saisie vide!!"
	fi
}

suppSal()
{
	numSal=$(echo "$1" | cut -d "|" -f1)
        bloc=$(echo "$1" | cut -d "|" -f2)
        nomSal=$(echo "$1" | cut -d "|" -f3)
        numSal=$(echo "$1" | cut -d "|" -f4)
        ndo="$numSal$nomSal$bloc".txt
        if [ -e "/home/brahbong/appGEst/salle_Gest/$ndo" ];
        then
                rm -r /home/brahbong/appGEst/salle_Gest/$ndo
                echo "La salle Numero salle: $numSal Nom salle: $nomSal Bloc: $bloc est supprimée"
        else
                echo "Salle inexistante!!"
        fi

}

case $2 in
	1)	ajoutSal $1
		;;
	2)	suppSal $1
		;;
esac
