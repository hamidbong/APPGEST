#!/bin/bash
ajoutPat()
{
	id=$(echo "$1" | cut -d "|" -f1)
        nom=$(echo "$1" | cut -d "|" -f2)
        prenom=$(echo "$1" | cut -d "|" -f3)
        age=$(echo "$1" | cut -d "|" -f4)
	genre=$(echo "$1" | cut -d "|" -f5)
        symptomes=$(echo "$1" | cut -d "|" -f6)
        maladie=$(echo "$1" | cut -d "|" -f7)
        genre=$(echo "$1" | cut -d "|" -f8)
        datDeb=$(echo "$1" | cut -d "|" -f9)
	numSal=$(echo "$1" | cut -d "|" -f10)
	handicap=$(echo "$1" | cut -d "|" -f11)
        ndo="$id$nom$prenom".txt
	if [ "$ndo" != "" ];
        then
                echo "Id: $id Nom: $nom Prenom: $prenom Age: $age genre: $genre Symptome Maladie: $maladie Genre: genre Date debut: $datdeb Numero: $numSal Handicap: $handicap" >> /home/brahbong/appGEst/patt_Gest/$ndo
                if [ -e "/home/brahbong/appGEst/patt_Gest/"$ndo ];
                then
                        echo "Patient ajouté sous personnel_gest sur :$ndo"
                else
                        echo "Patient non ajouté!!"
                fi
        else
                echo "progromme quitté!!"
        fi

}

suppPat()
{
        id=$(echo "$1" | cut -d "|" -f1)
        nom=$(echo "$1" | cut -d "|" -f2)
        prenom=$(echo "$1" | cut -d "|" -f3)
	numSal=$(echo "$1" | cut -d "|" -f4)
        ndo="$id$nom$prenom".txt
        if [ -e "/home/brahbong/appGEst/patt_Gest/$ndo" ];
        then
                rm -r /home/brahbong/appGEst/patt_Gest/$ndo
                echo "Le patient ID: $id Nom: $nom Prenom: $prenom est supprimé"
        else
                echo "Patient inexistant!!"
        fi
}

affectSal()
{
	id=$(echo "$1" | cut -d "|" -f1)
        nom=$(echo "$1" | cut -d "|" -f2)
        prenom=$(echo "$1" | cut -d "|" -f3)
        anSal=$(echo "$1" | cut -d "|" -f4)
        nvSal=$(echo "$1" | cut -d "|" -f5)
	datDeb=$(echo "$1" | cut -d "|" -f6)
        ndo="$id$nom$prenom".txt
        cd /home/brahbong/appGEst/patt_Gest
        if [ -e "/home/brahbong/appGEst/patt_Gest/$ndo" ];
        then
                sed -i 's/'$anSal'/'$nvSal'/' $ndo
                echo "Données mises à jour!!!"
        else
                echo "Patient inexistant!!"
        fi


}

genFact()
{
	id=$(echo "$1" | cut -d "|" -f1)
        nom=$(echo "$1" | cut -d "|" -f2)
        prenom=$(echo "$1" | cut -d "|" -f3)
        maladie=$(echo "$1" | cut -d "|" -f4)
        numSal=$(echo "$1" | cut -d "|" -f5)
        dateDeb=$(echo "$1" | cut -d "|" -f6)
        dateFin=$(echo "$1" | cut -d "|" -f7)
        monTo=$(echo "$1" | cut -d "|" -f8)
        ndo="$id$nom$prenom".txt
        if [ "$ndo" != "" ];
        then
                echo "Id: $id Nom: $nom Prenom: $prenom Maladie: $maladie Numero salle: $numSal Date Debut: $dateDeb Date fin: $dateFin Montant Total: $monTo" >> /home/brahbong/appGEst/patt_Gest/les_Factures/$ndo
                if [ -e "/home/brahbong/appGEst/patt_Gest/les_Factures/"$ndo ];
                then
                        echo "Facure ajouté sous les_factures sur :$ndo"
                else
                        echo "Facture non ajouté!!"
                fi
        else
                echo "progromme quitté!!"
        fi
}




case $2 in
        1)      ajoutPat $1
                ;;
        2)      suppPat $1
                ;;
        3)      affectSal $1
		;;
        4)      genFact $1
		;;
esac


