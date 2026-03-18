#!/bin/bash
ajout()
{
	id=$(echo "$1" | cut -d "|" -f1)
	nom=$(echo "$1" | cut -d "|" -f2)
	prenom=$(echo "$1" | cut -d "|" -f3)
	fonction=$(echo "$1" | cut -d "|" -f4)
	salaire=$(echo "$1" | cut -d "|" -f5)
	bloc=$(echo "$1" | cut -d "|" -f6)
	dateDeb=$(echo "$1" | cut -d "|" -f7)
	diplome=$(echo "$1" | cut -d "|" -f8)
	ndo="$id$nom$prenom".txt
	if [ "$ndo" != "" ];
	then
		echo "id: $id nom: $nom prnom: $prenom fonction: $fonction salaire: $salaire bloc: $bloc dateDeb: $dateDeb diplome: $diplome" >> /home/brahbong/appGEst/personnel_Gest/$ndo
		if [ -e "/home/brahbong/appGEst/personnel_Gest/"$ndo ];
		then
			echo "Employé ajouté sous personnel_gest sur :$ndo"
		else
			echo "Employé non ajouté!!"
		fi
	else
		echo "progromme quitté!!"
	fi
}
affecterBloc()
{
	id=$(echo "$1" | cut -d "|" -f1)
        nom=$(echo "$1" | cut -d "|" -f2)
        prenom=$(echo "$1" | cut -d "|" -f3)
	anBloc=$(echo "$1" | cut -d "|" -f4)
	nvBloc=$(echo "$1" | cut -d "|" -f5)
        dateDeb=$(echo "$1" | cut -d "|" -f6)
	ndo="$id$nom$prenom".txt
	cd /home/brahbong/appGEst/personnel_Gest
	if [ -e "/home/brahbong/appGEst/personnel_Gest/$ndo" ];
	then
		sed -i 's/'$anBloc'/'$nvBloc'/' $ndo
		echo "Données mises à jour!!!"
	else
		echo "Employé inexistant!!"
	fi
}
changerSalaire()
{
	id=$(echo "$1" | cut -d "|" -f1)
        nom=$(echo "$1" | cut -d "|" -f2)
        prenom=$(echo "$1" | cut -d "|" -f3)
       	anMont=$(echo "$1" | cut -d "|" -f4)
        nvMont=$(echo "$1" | cut -d "|" -f5)
        dateDeb=$(echo "$1" | cut -d "|" -f6)
        ndo="$id$nom$prenom".txt
	cd /home/brahbong/appGEst/personnel_Gest
        if [ -e "/home/brahbong/appGEst/personnel_Gest/$ndo" ];
        then
                sed -i 's/'$anMont'/'$nvMont'/' $ndo
		echo "Nouveau salaire est: $nvMont"
                echo "Données mises à jour!!!"
        else
                echo "Employé inexistant!!"
        fi

}

suppEmploye()
{
	id=$(echo "$1" | cut -d "|" -f1)
        nom=$(echo "$1" | cut -d "|" -f2)
        prenom=$(echo "$1" | cut -d "|" -f3)
	ndo="$id$nom$prenom".txt
        if [ -e "/home/brahbong/appGEst/personnel_Gest/$ndo" ];
	then
		rm -r /home/brahbong/appGEst/personnel_Gest/$ndo
		echo "L'employé ID: $id Nom: $nom Prenom: $prenom est supprimé!!!"
	else
		echo "Employé inexistant!!"
	fi
}

case $2 in
	1)	ajout $1 $2
		;;
	2)	affecterBloc $1 $2
		;;
	3)	changerSalaire $1 $2
		;;
	4)	suppEmploye $1 $2
		;;
esac

