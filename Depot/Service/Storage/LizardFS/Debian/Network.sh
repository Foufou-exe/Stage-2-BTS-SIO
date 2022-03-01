#!/bin/bash -e

function Config_Network {
    Network_choices=True
    while [ $Network_choices ]
    do
        read -n3 -p "Voulez-vous configurer votre interface réseaux ? (yes/no) :" rep
          if [ "$rep" = "yes" ] || [ "$rep" = "y" ]
          then
                if [ -e "/etc/systemd/network/01.network" ]
                 then
                 echo -e "Le Fichier existe déja 😉\n"
                 read -p "Quel Nom voulez-vous donner a votre Fichier de Configuration d'Interface ? 🙃:" fichier
                 touch /etc/systemd/network/${fichier}
                 read -p "Nom Interface :" IF
                 read -p "L'IP : " IP
                 read -p "Gateway :" GT
                 read -p "DNS :" DNS
                 echo -e "[Match]\nName=$IF\n[Network]\nAddress=$IP\nGateway=$GT\nDNS=$DNS" >> /etc/systemd/network/${fichier}
                 echo -e "\n"
                else
                 echo -e "Le Fichier n'existe pas 😣\n"
                 touch /etc/systemd/network/01.network
                 read -p "Nom Interface :" IF
                 read -p "L'IP : " IP
                 read -p "Gateway :" GT
                 read -p "DNS :" DNS
                 echo -e "[Match]\nName=$IF\n[Network]\nAddress=$IP\nGateway=$GT\nDNS=$DNS" >> /etc/systemd/network/01.network
                 echo -e "\n"
                fi
                 sleep 2
                 echo -e "Application sur l'interface ⏳\n"
                 systemctl restart systemd-networkd
                 sleep 3
                 echo -e "C'est bon l'interface est enfin configurée ✅\n"
                 sleep 2
                 echo -e "Voici votre configuration d'interface via $IF\n"
                 ip addr show $IF
                 sleep 2
            else
             sleep 2
             echo "Vous quittez le Menu de Configuration d'interface 👋"
             sleep 2
             echo -e "\nGoodbye👋👋"
             sleep 1
             exit
            fi
            read -n3 -p  "Maintenant que vous avez terminé votre configuration,est-ce que vous voulez configurer une nouvelle interface ? (yes/no)🤠:" rep4
            if [ "$rep4" = "no" ] || [ "$rep4" = "n" ]
            then
              echo "Vous quittez le Menu de Configuration d'interface 👋"
              sleep 1
              exit
            fi
    done
}

Config_Network