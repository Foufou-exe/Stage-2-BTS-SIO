#!/bin/bash -e

#                       <---------------------------------------------- Import Script ------------------------------------------------------------>

Script_PATH1="/root/Centos/Master.sh"
Script_PATH2="/root/Centos/Chunk.sh"
Script_PATH3="/root/Centos/Chunk_MetaLogger.sh"
Script_PATH4="/root/Centos/Shadow.sh"
Script_PATH5="/root/Centos/Client.sh"

#                       <--------------------------------------------- Appelle des variables ------------------------------------------------------>

Master=$"$Script_PATH1"
Chunk=$"$Script_PATH2"
Chunk_MetaLogger=$"$Script_PATH3"
Shadow=$"$Script_PATH4"
Client=$"$Script_PATH5"

#                       <---------------------------------------------- Appelle des Fonctions ----------------------------------------------------->

function main {
    Autorisations
    hostname
    pre-requis
    host
    list_install
    choix_list_install
}

function pre-requis {
    echo "Lancement du Script d'installation 👌"
    sleep 15
    echo "Installation des pré-requis 🎈"
    sleep 5
    yum install -y lsb-release wget gnupg apt-transport-https dpkg-dev gzip epel-release yum-utils
    curl http://packages.lizardfs.com/yum/el7/lizardfs.repo > /etc/yum.repos.d/lizardfs.repo
    yum update
    yumdownloader --source lizardfs
    sleep 10
    echo "Pré-requis installé😊"
}

function hostname {
    read -p "Choisir le nom de la machine :" name
    hostname $name
}

function Autorisations {
    chmod 777 Centos/*
}


function host {
    sleep 5
    echo "Ajouts des IP dans le Fichier Host 🤠"
    echo -e "\n10.142.100.1 Chunk1 MetaLogger1 CGI1\n10.142.100.2 Chunk2 CGI2\n10.142.100.3 Chunk3 CGI3\n10.142.100.100 Master mfsmaster\n10.142.100.101 Shadow1 mfsmaster\n10.142.100.200 Client">>/etc/hosts
    sleep 5
    echo "Ajout effectué ✅"
    sleep 10
}

function list_install {
    echo -e "\nInstallation sur ? :"
    echo -e "1) Master"
    echo -e "2) Chunk"
    echo -e "3) Metalogger"
    echo -e "4) Shadow"
    echo -e "5) Client"
    echo -e "6) Exit\n"
}

function choix_list_install {
    read -n1 -p "Choisir l'option (1-5) : " Action_main
    if [ "$Action_main" == "1" ]; then
       echo $Master
    elif [ "$Action_main" == "2" ]
        echo $Chunk
    elif [ "$Action_main" == "3" ]
        echo $Chunk_MetaLogger
    elif [ "$Action_main" == "4" ]
        echo $Shadow
    elif [ "$Action_main" == "5" ]
        echo $Client
    elif [ "$Action_main" == "6" ]
        exit     
    else
    echo "Incorrect,Réessaye 😓!"
        choisir_categorie_main
    fi
}

#                       <---------------------------------------------- Excution du script ------------------------------------------------------------>


main
