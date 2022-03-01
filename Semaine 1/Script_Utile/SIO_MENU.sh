#!/bin/bash -e

################################################################################################################################################################################################
################################################################################################################################################################################################
                                        
                                                                            #FONCTION

################################################################################################################################################################################################
################################################################################################################################################################################################

function Network {
    Network_choices=True
    while [ Network_choices ]
    do
        read -n3 -p "Voulez-vous configurer votre interface réseaux ? (yes/no) :" rep
          if [ "$rep" = "yes" ] || [ "$rep" = "y" ]
          then
                if [ -e "/etc/systemd/network/01.network" ]
                 then
                 echo 'Le Fichier existe déja 😉'
                 read -p "Quel Nom voulez-vous donner a votre Fichier de Configuration d'Interface ? 🙃:" fichier
                 touch $fichier
                 read -p "Nom Interface :" IF
                 read -p "L'IP : " IP
                 read -p "Gateway :" GT
                 read -p "DNS :" DNS
                 echo -e "[Match]\nName=$IF\n[Network]\nAddress=$IP\nGateway=$GT\nDNS=$DNS" >> /etc/systemd/network/$fichier
                 echo
                else
                 echo "Le Fichier n'existe pas 😣"
                 touch /etc/systemd/network/01.network
                 read -p "Nom Interface :" IF
                 read -p "L'IP : " IP
                 read -p "Gateway :" GT
                 read -p "DNS :" DNS
                 echo -e "[Match]\nName=$IF\n[Network]\nAddress=$IP\nGateway=$GT\nDNS=$DNS" >> /etc/systemd/network/01.network
                 echo
                fi
                 echo "Application sur l'interface ⏳"
                 systemctl restart systemd-networkd
                 echo "C'est bon l'interface est enfin configurée ✅"
                 echo "Voici votre configuration d'interface via $IF"
                 ip addr show $IF
            else
             echo "Vous quittez le Menu de Configuration d'interface 👋"
             echo -e "\nGoodbye👋👋"
             exit
             clear
            fi
            read -n1 -p  "Maintenant que vous avez terminé votre configuration,est-ce que vous voulez configurer une nouvelle interface ? (yes/no)🤠:" rep4
            if [ "$rep4" = "no" ] || [ "$rep4" = "n" ]
            then
              echo "Vous quittez le Menu de Configuration d'interface 👋"
              exit
              clear
            fi
    done
}

function Banniere {
    echo -e "███▄    █ ▓█████ ▄▄▄█████▓ █     █░ ▒█████   ██▀███   ██ ▄█▀\n ██ ▀█   █ ▓█   ▀ ▓  ██▒ ▓▒▓█░ █ ░█░▒██▒  ██▒▓██ ▒ ██▒ ██▄█\n ▓██  ▀█ ██▒▒███   ▒ ▓██░ ▒░▒█░ █ ░█ ▒██░  ██▒▓██ ░▄█ ▒▓███▄░ \n ▓██▒  ▐▌██▒▒▓█  ▄ ░ ▓██▓ ░ ░█░ █ ░█ ▒██   ██░▒██▀▀█▄  ▓██ █▄ \n▒██░   ▓██░░▒████▒  ▒██▒ ░ ░░██▒██▓ ░ ████▓▒░░██▓ ▒██▒▒██▒ █▄\n░ ▒░   ▒ ▒ ░░ ▒░ ░  ▒ ░░   ░ ▓░▒ ▒  ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░▒ ▒▒ ▓▒\n░ ░░   ░ ▒░ ░ ░  ░    ░      ▒ ░ ░    ░ ▒ ▒░   ░▒ ░ ▒░░ ░▒ ▒░\nBy Razmo | BASH | https://github.com/Foufou-exe"
}

function Main {
    clear
    Banniere
    afficher_choix_main
    choisir_categorie_main
   
}

function afficher_choix_main {
    echo -e "\n1) Network"
    echo -e "2) Application"
    echo -e "3) Basic Application Setup"
    echo -e "4) Exit\n"
}

function choisir_categorie_main {
    read -n1 -p "Choisir l'option (1-4) : " Action_main
    if [ "$Action_main" == "1" ]; then
        Apply_Network
    elif [ "$Action_main" == "2" ]; then
        Application_everyone
    elif [ "$Action_main" == "3" ]; then
        Basic_Application_Setup
    elif [ "$Action_main" == "4" ]; then
        exit 
        clear     
    else
    echo "Incorrect,Réessaye 😓!"
        choisir_categorie_main
    fi
}

function list_apply_network {
    echo -e "\n1) Config Interface"
    echo -e "2) Outils Network"
    echo -e "3) Back to Menu"
    echo -e "4) Exit\n"
}


function Apply_Network {
    list_apply_network
    read -n1 -p "Choisi ton options (1-3) :" Action_main2
    if [ "$Action_main2" == "1" ]; then
        clear
        Banniere
        Network
    elif [ "$Action_main2" == "2"]; then
        clear
        Banniere
        Outils_Network
    elif [ "$Action_main2" == "3"]; then
        clear
        Banniere
        afficher_choix_main
        choisir_categorie_main
    elif [ "$Action_main2" == "4"]; then
       exit 
       clear
    else
        echo "Incorrect,Réessaye 😓!"
        clear
        Banniere
        list_apply_network
        choisir_categorie_main
    fi
}

function list_outils_network {
    echo -e "\n1) Curl"
    echo -e "2) Git"
    echo -e "3) Wget"
    echo -e "4) DNS"
    echo -e "5) Nslookup"
    echo -e "6) Tcpdump"
    echo -e "7) Nmap"
    echo -e "8) Back Menu"
    echo -e "9) Exit\n"
}

function Outils_Network {
    list_outils_network
    read -n1 -p "Choisi ton options (1-3) :" Action_main3
    if [ "$Action_main3" == "1" ]; then
        clear
        Banniere
        Service_Curl
    elif [ "$Action_main3" == "2"]; then
        clear
        Banniere
        Service_Git
    elif [ "$Action_main3" == "3"]; then
        clear
        Banniere
        Service_Wget
    elif [ "$Action_main3" == "4"]; then
        clear
        Banniere
        Service_DNS
    elif [ "$Action_main3" == "5"]; then
        clear
        Banniere
        Service_Nslookup
    elif [ "$Action_main3" == "6"]; then
        clear
        Banniere
        Service_Tcpdump
    elif [ "$Action_main3" == "7"]; then
        clear
        Banniere
        Service_Nmap
    elif [ "$Action_main3" == "8"]; then
        main.
    elif [ "$Action_main3" == "9"]; then
       exit 
       clear
    else
    echo "\nIncorrect,Réessaye 😓!"
        choisir_categorie_main
    fi
}

function Service_Curl {
    if [ ! package_exists curl ]; then
            apt install -y curl
            echo "\nInstallation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
       else
            echo "\nLe Service curl est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
        fi
}

function Service_Git {
    if [ ! package_exists git ]; then
            apt install -y git
            echo "Installation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
       else
            echo "Le Service git est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
        fi
}

function Service_Wget {
    if [ ! package_exists wget ]; then
            apt install -y wget
            echo "Installation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
       else
            echo "Le Service wget est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
        fi
}

function Service_DNS {
    if [ ! package_exists bind9 ]; then
            apt install -y bind9 
            echo "Installation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
       else
            echo "Le Service DNS est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
        fi
}

function Service_Nslookup {
    if [ ! package_exists dnsutils ]; then
            apt install -y dnsutils
            echo "Installation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
       else
            echo "Le Service nslookup est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
        fi
}

function Service_Tcpdump {
    if [ ! package_exists tcpdump ]; then
            apt install -y tcpdump
            echo "Installation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
       else
            echo "Le Service tcpdump est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
        fi
}

function Service_Nmap {
    if [ ! package_exists nmap ]; then
            apt install -y nmap
            echo "Installation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
       else
            echo "Le Service nmap est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
        fi
}

function package_exists {
    return dpkg -l "$1" &> /dev/null
}

function list_Application_everyone {
    echo -e "\n1) Apache"
    echo -e "2) Nginx"
    echo -e "3) Python3"
    echo -e "4) Python2"
    echo -e "5) Mariadb"
    echo -e "6) Php"
    echo -e "7) Mysql-php"
    echo -e "8) Sqlmap"
    echo -e "9) Update/Upgrade"
    echo -e "10) Exit\n"
}

function Application_everyone {
    list_Application_everyone
    read -n1 -p "Choisi ton options (1-3) :" Action_main2
    if [ "$Action_main2" == "1" ]; then
        clear
        Banniere
        Service_Apache
    elif [ "$Action_main2" == "2"]; then
        clear
        Banniere
        Service_Nginx
    elif [ "$Action_main2" == "3"]; then
        clear
        Banniere
        Service_Python3
    elif [ "$Action_main2" == "4"]; then
        clear
        Banniere
        Service_Python2
    elif [ "$Action_main2" == "5"]; then
        clear
        Banniere
        Service_Mariadb
    elif [ "$Action_main2" == "6"]; then
        clear
        Banniere
        Service_Php
    elif [ "$Action_main2" == "7"]; then
        clear
        Banniere
        Service_Mysql-php
    elif [ "$Action_main2" == "8"]; then
        clear
        Banniere
        Service_Sqlmap
    elif [ "$Action_main2" == "9"]; then
        clear
        Banniere
        Service_Update_Upgrade    
    elif [ "$Action_main2" == "10"]; then
        clear
        exit
    else
        sleep 10
        echo "\nIncorrect,Réessaye 😓!"
        main
    fi
}

function Service_Apache {
    if [ ! package_exists apache2 ]; then
            apt install -y apache2
            echo "Installation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            clear
            Outils_Network
       else
            echo "Le Service apache2 est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
        fi
}

function Service_Nginx {
    if [ ! package_exists nginx ]; then
            apt install -y nginx
            echo "Installation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
       else
            echo "Le Service nginx est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            clear
            Outils_Network
        fi
}

function Service_Python3 {
    if [ ! package_exists python3 ]; then
            apt install -y python3 python3-pip
            echo "Installation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
       else
            echo "Le Service python3 est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
        fi
}

function Service_Python2 {
    if [ ! package_exists python2 ]; then
            apt install -y python2
            echo "Installation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
       else
            echo "Le Service python2 est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
        fi
}

function Service_Mariadb {
    if [ ! package_exists mariadb-server ]; then
            apt install -y mariadb-server
            echo "Installation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
       else
            echo "Le Service mariadb est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
        fi
}

function Service_Php {
    if [ ! package_exists nmap ]; then
            apt install -y nmap
            echo "Installation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
       else
            echo "Le Service nmap est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
        fi
}

function Service_Mysql-php {
    if [ ! package_exists mysql-php ]; then
            apt install -y mysql-php
            echo "Installation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
       else
            echo "Le Service mysql-php est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
        fi
}

function Service_Sqlmap {
    if [ ! package_exists nmap ]; then
            apt install -y nmap
            echo "Installation effectue avec succes ✅ "
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
       else
            echo "Le Service nmap est déja installé 😎"
            echo -e "\nRetour au Menu 👀"
            sleep 10
            clear
            Outils_Network
        fi
}

function Service_Update_Upgrade {
    apt update && apt upgrade -y
    echo "Votre Systeme est maintenant à jour 😎"
    echo -e "\nRetour au Menu 👀"
    sleep 10
    clear
    Outils_Network   
}


function Basic_Application_Setup {
    clear
    Banniere
    echo -e "\nInstallation des Services 😀\n"
    sleep 10
    apt install -y nmap dns-utils php mariadb-server apache ftp proftpd ssh curl git wget Tcpdump
    echo -e "\nInstallation fini 🙂👍\n"
    echo -e "Retour au menu 👨‍💻"
    sleep 10
    main
}
################################################################################################################################################################################################
################################################################################################################################################################################################


################################################################################################################################################################################################
################################################################################################################################################################################################

                                                                            #Lancement Script Bash

################################################################################################################################################################################################
################################################################################################################################################################################################

Main
