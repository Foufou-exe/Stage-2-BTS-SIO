#!/bin/bash -e

function Config_ssh {
    echo -e "Configue du Fichier SSH 🥱 \n"
    sleep 1
    echo -e "Modification du Fichier SSH 👀"
    sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes">> /etc/ssh/sshd_config
    sleep 2
    echo -e "Fichier SSH Modifié avec succes ✅"
    sleep 1
}
Config_ssh