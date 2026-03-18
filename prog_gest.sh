#!/bin/bash
ch=$(zenity --list --width=360 --height=400 --title="Menu principal" \
--column="name" "Gestionnaire des personnels soignants"  "Gestionnaire des patients" \
 "Gestionnaire des salles")
if [ "$ch" = "Gestionnaire des personnels soignants" ];
then
	gest=$(zenity --list --width=360 --height=400 --title="Menu employé" \
	--column="name" "Ajouter un employé" "Affecter dans un bolc" "Changer salaire" "Supprimer un employé")
	if [ "$gest" = "Ajouter un employé" ];
	then
		a=1
	elif [ "$gest" = "Affecter dans un bolc" ];
	then
		a=2
	elif [ "$gest" = "Changer salaire" ];
	then
		a=3
	elif [ "$gest" = "Supprimer un employé" ];
	then
		a=4
	else
		echo "fin de programme!!!"
		exit 0
	fi
	case $a in
		1) form=$(zenity --forms --width=360 --height=400 \
			--title="Ajouter un employé" \
			 --text="les informations de l'employé" \
			--add-entry="ID" \
			--add-entry="nom" \
			--add-entry="prenom" \
			--add-entry="fonction" \
			--add-entry="Salaire" \
			--add-entry="Bloc" \
			--add-entry="date debut" \
			--add-entry="diplome")
			echo "$form";;
		2)form=$(zenity --forms --width=360 --height=400 \
			--title="Affecter dans un bolc" \
			--text="Identifier l'employé" \
                        --add-entry="ID:" \
                        --add-entry="nom:" \
                        --add-entry="prenom:" \
			--add-entry="Ancien bloc" \
			--add-entry="le nouveau bloc" \
                        --add-calendar="date debut")
                        echo "$form";;
		3)form=$(zenity --forms --width=360 --height=400 \
			--title="Changer salaire" \
			--text="Identifier l'employé" \
                        --add-entry="ID:" \
                        --add-entry="nom:" \
                        --add-entry="prenom:" \
                        --add-entry="Ancien montant" \
                        --add-entry="Nouveau montant" \
			--add-calendar="date debut")
			;;
		4)form=$(zenity --forms --width=360 --height=400 \
			--title="Supprimer un employé" \
			--text="Identifier l'employé" \
                        --add-entry="ID:" \
                        --add-entry="Nom:" \
                        --add-entry="Prenom:")
                        echo "$form";;
	esac
	./gest_soign.sh "$form" $a

elif [ "$ch" = "Gestionnaire des patients" ];
then
	gest=$(zenity --list --width=360 --height=400 --title="Menu patient" \
--column="name" "Ajouter un patient" "Supprimer un patient" \
"Affecter dans une salle" "Generer une facture")
	if [ "$gest" = "Ajouter un patient" ];
        then
                b=1
        elif [ "$gest" = "Supprimer un patient" ];
        then
                b=2
        elif [ "$gest" = "Affecter dans une salle" ];
        then
                b=3
        elif [ "$gest" = "Generer une facture" ];
        then
                b=4
        else
                echo "fin de programme"
        fi
	case $b in
		1)form=$(zenity --forms --width=360 --height=400 \
                        --title="Ajouter un patient" \
                        --text="Les informations du patient" \
                        --add-entry="ID:" \
                        --add-entry="Nom:" \
                        --add-entry="Prenom:" \
                        --add-entry="Age:" \
			--add-entry="Genre" \
			--add-entry="Symptomes:" \
			--add-entry="Maladie" \
			--add-entry="Genre:" \
                        --add-entry="Date debut:" \
			--add-entry="Numero de salle:" \
                        --add-entry="Handicap:")
                        echo "$form";;
		2)form=$(zenity --forms --width=360 --height=400 \
			--title="Supprimer un patient" \
			--text="Identifier le patient" \
                        --add-entry="ID:" \
                        --add-entry="nom:" \
                        --add-entry="prenom:" \
			--add-entry="Salle du patient:")
                        echo "$form";;
		3)form=$(zenity --forms --width=360 --height=400 \
			--title="Affecter dans une salle" \
			--text="Identifier le patient" \
                        --add-entry="ID:" \
                        --add-entry="nom:" \
                        --add-entry="prenom:" \
                        --add-entry="Ancienne salle N°:" \
			--add-entry="Nouvelle salle N°:"\
                        --add-calendar="Date debut")
			echo "$form";;
		4)form=$(zenity --forms --width=360 --height=400 \
                        --title="Generer une facture:" \
                        --text="Le patient" \
                        --add-entry="ID:" \
                        --add-entry="Nom:" \
                        --add-entry="Prenom:" \
                        --add-entry="Maladie:" \
			--add-entry="Numero de salle:" \
			--add-entry="Date debut:" \
                        --add-entry="Date fin:" \
			--add-entry="Montant total (DTN):")
                        echo "$form";;
	esac
	./gest_patient.sh "$form" $b

elif [ "$ch" = "Gestionnaire des salles" ];
then
	gest=$(zenity --list --width=360 --height=400 --title="Menu Salle" \
--column="Selectionner une option" "Creer une salle" "Supprimer une salle")
	if [ "$gest" = "Creer une salle" ];
	then
		c=1
	elif [ "$gest" = "Supprimer une salle" ];
	then
		c=2
	else
		echo "Fin du programme"
		exit 0
	fi

	case $c in
		1)form=$(zenity --forms --width=360 --height=400 \
                        --title="Creer une salle:" \
                        --text="Info salle:" \
                        --add-entry="Num salle:" \
                        --add-entry="Nom:" \
                        --add-entry="Bloc" \
			--add-entry="ID patient:")
			echo "$form"
			;;
		2)form=$(zenity --forms --width=360 --height=400 \
                        --title="Supprimer une salle:" \
                        --text="Info salle:" \
                        --add-entry="Num salle:" \
                        --add-entry="Bloc" )
			echo "$form"
			;;
	esac
	echo "!!!!!!!!!!!$c"
	./gest_salle.sh "$form" $c
else
	echo "fin du programme"
fi

