#!/bin/bash -e

#                       <---------------------------------------------- Appelle des Fonctions ----------------------------------------------------->

function install {
    sudo apt install -y lsb-release wget gnupg apt-transport-https dpkg-dev gzip
    sudo apt update -y
    sudo apt upgrade -y
    echo 'deb [trusted=yes] https://dev.lizardfs.com/packages/ bullseye/' | tee /etc/apt/sources.list.d/lizardfs.list
    echo 'deb https://dev.lizardfs.com/packages/ bullseye/' | tee /etc/apt/sources.list.d/lizardfs.list
    sudo apt -y update
    sudo apt source lizardfs
    sudo apt install -y lizardfs-common lizardfs-master lizardfs-cgiserv lizardfs-adm
    sudo cp /var/lib/lizardfs/metadata.mfs.empty /var/lib/lizardfs/metadata.mfs
    sudo cp /usr/share/doc/lizardfs-master/examples/mfsmaster.cfg /etc/lizardfs/mfsmaster.cfg
    sudo sed -i "s/#PERSONALITY = shadow/PERSONALITY = shadow/; s/#MASTER_HOST = 10.142.100.100/MASTER_HOST = 10.142.100.100/; s/#WORKING_USER = lizardfs/WORKING_USER = lizardfs/; s/#WORKING_GROUP = lizardfs/WORKING_GROUP = lizardfs/; s/#EXPORTS_FILENAME = /etc/lizardfs/mfsexports.cfg/EXPORTS_FILENAME = /etc/lizardfs/mfsexports.cfg/; s/#DATA_PATH = /var/lib/lizardfs/DATA_PATH = /var/lib/lizardfs/">>/etc/lizardfs/mfsmaster.cfg
    sudo cp /usr/share/doc/lizardfs-master/examples/mfsexports.cfg /etc/lizardfs/mfsexports.cfg
    sudo cp /usr/share/doc/lizardfs-master/examples/mfsgoals.cfg /etc/lizardfs/mfsgoals.cfg
    sed "s/# 15 default_xor3 : $xor3/15 default_xor3 : $xor3/">>/etc/lizardfs/mfsgoals.cfg
    sudo service lizardfs-master start
    sudo service lizardfs-cgiserv start
}

#                       <---------------------------------------------- Excution du script ------------------------------------------------------------>

install