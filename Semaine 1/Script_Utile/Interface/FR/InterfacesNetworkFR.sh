#!/bin/bash -e
# UTF-8 encoded
#<---- Fonction ---->


function Network {  #On crée la Fonction Network qui aura pour but de rassembler toute la configuration Réseaux
    Network_choices=True  # On crée une variable qui a pour valeur vraie
    while [ Network_choices ]  # On crée une Boucle qui va permettre de recommence le scripte si voulu ou en cas d erreur
    do
        read -p "Voulez-vous configurer votre interface réseaux ? (yes/no) :" rep  #On demande à l utilisateur si il veut configurer l interface réseaux si oui on regarde la ligne en dessous si non on sort du script
          if [ $rep = "yes" ] || [ $rep = "y" ] || [ $rep = "YES"] || [ $rep = "Oui"] || [ $rep = "o"] # Condition 1: Suivant la reponse donné par l utilisateur,si c'est yes/y/Oui/o il va poursuivre via la ligne en dessous
          then
                if [ -e "/etc/systemd/network/01.network" ] # Condition 2: On verifie que le Fichier 01.network existe si oui on regarde la ligne en dessous
                 then  # Ensuite
                 sleep 1 # On attend 1 seconde 
                 echo 'Le Fichier existe déja 😉' # On va dire que le Fichier existe déjà par rapport à la Condition 2
                 sleep 1 # On attend 1 seconde
                 read -p "Quel Nom voulez-vous donner a votre Fichier de Configuration d'Interface ? 🙃:" fichier  # On demande à l utilisateur de donnée un nom pour le fichier de Configuration ,la variable $fichier va prendre la valeur donnée
                 touch $fichier # On crée le fichier qui aura pour nom la valeur donnée dans $fichier
                 read -p "Nom Interface (eth?,enp?s?) :" NIF  # On demande à l utilisateur de donnée un nom pour l interface et la variable $NIF prendra la valeur donnée
                 read -p "L'IP (XXX.XXX.XXX.XXX/YY) : " IP  # On demande à l utilisateur de donnée un nom pour l interface et la variable $IP prendra la valeur donnée
                 read -p "Gateway (Passerelle) :" GT  # On demande à l utilisateur de donnée un nom pour l interface et la variable $GT prendra la valeur donnée  
                 read -p "DNS :" DNS  # On demande à l utilisateur de donnée un nom pour l interface et la variable $DNS prendra la valeur donnée  
                 echo -e "[Match]\nName=$NIF\n[Network]\nAddress=$IP\nGateway=$GT\nDNS=$DNS" >> /etc/systemd/network/$fichier   # On Retourne dans Fichier un texte prédefinie qui inclue les variable qu on déclaré avant dans un chemin précisé
                 echo "" # Retourne un vide
                else # Sinon si il n existe pas le Fichier on regarde la ligne en dessous
                 sleep 1 # On attend 1 seconde
                 echo "Le Fichier n'existe pas 😣" # On va dire que le Fichier n existe pas par rapport à la Condition 2
                 touch /etc/systemd/network/01.network # On va créer le fichier 01.network par default dans un chemin précis
                 sleep 1 # On attend 1 seconde
                 read -p "Nom Interface (eth?,enp?s?) :" NIF  # On demande à l utilisateur de donnée un nom pour l interface et la variable $NIF prendra la valeur donnée
                 read -p "L'IP (XXX.XXX.XXX.XXX/YY) : " IP  # On demande à l utilisateur de donnée un nom pour l interface et la variable $IP prendra la valeur donnée
                 read -p "Gateway (Passerelle) :" GT  # On demande à l utilisateur de donnée un nom pour l interface et la variable $GT prendra la valeur donnée  
                 read -p "DNS :" DNS  # On demande à l utilisateur de donnée un nom pour l interface et la variable $DNS prendra la valeur donnée  
                 echo -e "[Match]\nName=$NIF\n[Network]\nAddress=$IP\nGateway=$GT\nDNS=$DNS" >> /etc/systemd/network/$fichier   # On Retourne dans Fichier un texte prédefinie qui inclue les variable qu on déclaré avant dans un chemin précisé
                 echo "" # Retourne un vide
                fi  # Pour Finir
                 echo "Application sur l'interface ⏳"  # On dit qu on applique sur l interface les modifications/créations qu on effectuer juste avant
                 sleep 1 # On attend 1 seconde
                 systemctl restart systemd-networkd  # On redemarre le service systemd-networkd
                 sleep 2 # On attend 2 seconds
                 echo "C'est bon l'interface est enfin configurée ✅"  # On dit que l interface est enfin configurée
                 sleep 2 # On attend 2 seconds
                 echo "Voici votre configuration d'interface via $NIF"  # On dit LA configuration de l interface via la variable $NIF
                 ip addr show $NIF # On montre l'interface via la commande ainsi que l argument $NIF
            else # Sinon si il a reponse est non ou no ou autre que les réponses demander alors voir la ligne en dessous
             echo "Vous quittez le Menu de Configuration d'interface 👋" #On dit qu on va quitter le menu de configuration d interface
             sleep 1 # On attend 1 seconde
             echo -e "\nGoodbye👋👋" #On dit au revoir
             sleep 2 # On attend 2 seconds
             exit #Quitte le script
            fi #Pour Finir
            read -p  "Maintenant que vous avez terminé votre configuration,est-ce que vous voulez configurer une nouvelle interface ? (yes/no)🤠:" rep4  #On demande à l utilisateur si il veut configurer une nouvelle interface ? suivant ça reponse la variable $rep4 prendra la valeur donnée
            if [ $rep4 = "no" ] || [ $rep4 = "n" ] || [ $rep4 = "Non"] || [ $rep4 = "NO"] || [ $rep4 = "NON"] || [ $rep4 = "N"] # Condition 3 :Si la valeur de $rep4 est No/N/n/Non/NON/NO alors voir la ligne en dessosu
            then # Ensuite
              sleep 2 # On attend 2 seconds
              echo "Vous quittez le Menu de Configuration d'interface 👋" #On dit qu on va quitter le menu de configuration d interface
              sleep 1 # On attend 1 seconde
              exit #On quitter le Script
            fi #Pour finir ,si la valeur de $rep4 de la condition 3 étant yes/y ou autre que non alors on retourne au début du script
  done # Terminer
}

function Main { #On crée la fonction Main qui va servir à faire appelle au autres fonction
    clear # On supprime tous les messages d'avant
    # Petit Logo en ASCII
    echo -e "███▄    █ ▓█████ ▄▄▄█████▓ █     █░ ▒█████   ██▀███   ██ ▄█▀\n ██ ▀█   █ ▓█   ▀ ▓  ██▒ ▓▒▓█░ █ ░█░▒██▒  ██▒▓██ ▒ ██▒ ██▄█\n ▓██  ▀█ ██▒▒███   ▒ ▓██░ ▒░▒█░ █ ░█ ▒██░  ██▒▓██ ░▄█ ▒▓███▄░ \n ▓██▒  ▐▌██▒▒▓█  ▄ ░ ▓██▓ ░ ░█░ █ ░█ ▒██   ██░▒██▀▀█▄  ▓██ █▄ \n▒██░   ▓██░░▒████▒  ▒██▒ ░ ░░██▒██▓ ░ ████▓▒░░██▓ ▒██▒▒██▒ █▄\n░ ▒░   ▒ ▒ ░░ ▒░ ░  ▒ ░░   ░ ▓░▒ ▒  ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░▒ ▒▒ ▓▒\n░ ░░   ░ ▒░ ░ ░  ░    ░      ▒ ░ ░    ░ ▒ ▒░   ░▒ ░ ▒░░ ░▒ ▒░\nBy Foufou-exe | BASH | https://github.com/Foufou-exe"
    echo -e "\nLancement du Script de configuration d'interface 😄" #On dit qu on est entrain de lance le script de configuration d'interface'
    echo " " # On retourne un vide
    Network   #On fait appelle à la fonction Network
}

#<------- Lancement du Script de configuration d'interface ------->
Main #On appelle la fonction Main pour pouvoir lancer le script et ainsi pouvoir lancer les autres fonctions