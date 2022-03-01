#!/bin/bash -e


#                       <---------------------------------------------- Appelle des Fonctions ----------------------------------------------------->

function install {
    yum install -y lsb-release wget gnupg apt-transport-https dpkg-dev gzip epel-release yum-utils
    yum update -y
    curl http://packages.lizardfs.com/yum/el7/lizardfs.repo > /etc/yum.repos.d/lizardfs.repo
    yum update -y
    yumdownloader --source lizardfs
    yum install -y lizardfs-client
    mkdir /mnt/lizardfs
    mfsmount /mnt/lizardfs
}

#                       <---------------------------------------------- Excution du script ------------------------------------------------------------>

install