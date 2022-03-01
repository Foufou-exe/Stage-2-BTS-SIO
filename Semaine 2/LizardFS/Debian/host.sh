#!bin/bash -e

function config {
    Config_host=True
    while [ $Config_host ]; do
        echo -e "Configue du Fichier Host 🤠\n"
        read -n3 -p "Vous voulez configurer le Fichier Host ? : " rep
        if [ "$rep" = "yes" ] || [ "$rep" = "y" ]; then
            echo -e "\n"
            read -p "Veuillez saisir L'IP ainsi que le hostname : " rep2
            echo -e "\n$rep2">>/etc/hosts
            sleep 2
            echo -e "\nFichier Hosts modifié 😝"
            sleep 2
            echo -e "\nRetour au Menu de Configuration du Fichier Hosts 😶"
            sleep 2
            clear
        else
            echo -e "\n"
            echo "Vous quittez le Menu Configue du Fichier Hosts !!!😨😨"
            sleep 2
            exit
        fi
    done
}
config