#!/bin/bash -e


# <------------------- Déclaration de la Fonction ------------------->

function adduser(){
    while (true) do
        command=$0  #Déclaration de la variable $command,commande va permettre de recupere le nom du script
        usr=$2      #Déclaration de la variable $usr,usr va permettre recupere le token de l utilisateur via $2 qui lui sert a recupere l arguments donnée au moment de l excution du script
        file="/media/lizard/${usr}" #Déclaration de la variable $file,file va permettre de recupere le chemin de l utilisateur via $usr
        if [ $1 == "--addtoken" ]; then  #Condition : si l'option du scripte étant --addtoken alors ça excute la ligne en dessous 
            if [ ! -d $file ]; then #Condition : si dans la variable $file le contenant n'existe pas alors ça excute la ligne en dessous sinon on retourne une erreur
                useradd --badnames -d /media/lizard/${usr} -s /bin/sh ${usr} && mkdir -p /media/lizard/${usr}/corbeille /media/lizard/${usr}/data    #Création de l'utilisateur ainsi que son répertoire,groupe.
                return
            else
            echo Error: Failed to create ${usr} because the user already exists so its repository $file [$(date)] >>/var/log/script_adduser.log #Retourne une Erreur de création de l utilisateur car il existe déjà puis le message et envoyer dans les logs : /var/log/script_adduser.log
            fi
        else
            echo Error : Failed to choose option ,please choose option [exemple] : $command (--addtoken/--rmtoken) arguments
        fi

        if [ $1 == "--rmtoken" ]; then     #Condition : si l'option du scripte étant --rmtoken alors ça excute la ligne en dessous 
            if [ -d $file ] #Condition : si dans la variable $file le contenant existe alors on excute la ligne en dessous sinon on retourne une erreur
                userdel -r ${usr} && rm -r /media/lizard/${usr}  #Suppression de l'utilisateur ainsi que son répertoire
                return
            else
                echo Error: Failed to remove ${usr} so it repository ${file} [$(date)] >>/var/log/script_rmuser.log #Erreur de suppression de l'utilisateur ainsi que son répertoire car il a était dejà supprimer puis le message et envoyer dans les logs : /var/log/script_rmuser.log
            fi
        else
            echo Error : Failed to choose option ,please choose option [exemple] : $command (--addtoken/--rmtoken) arguments
        fi
    done
}


# <------------------- Utilisation de la Fonction ------------------->

adduser $0 $1 $2

