#!/bin/bash -e


#                       <---------------------------------------------- Appelle des Fonctions ----------------------------------------------------->

function install {
   sudo apt install -y lsb-release wget gnupg apt-transport-https dpkg-dev gzip
   sudo apt update -y && apt upgrade -y
    echo 'deb [trusted=yes] https://dev.lizardfs.com/packages/ bullseye/' | tee /etc/apt/sources.list.d/lizardfs.list
    echo 'deb https://dev.lizardfs.com/packages/ bullseye/' | tee /etc/apt/sources.list.d/lizardfs.list
    sudo apt -y update
    sudo apt source lizardfs
    sudo apt install -y lizardfs-client
    mkdir /mnt/lizardfs
    mfsmount /mnt/lizardf
}

#                       <---------------------------------------------- Excution du script ------------------------------------------------------------>

install