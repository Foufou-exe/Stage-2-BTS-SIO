#!/bin/bash -e

#                       <---------------------------------------------- Appelle des Fonctions ----------------------------------------------------->

function install {
    yum install -y lsb-release wget gnupg apt-transport-https dpkg-dev gzip epel-release yum-utils
    yum update -y
    curl http://packages.lizardfs.com/yum/el7/lizardfs.repo > /etc/yum.repos.d/lizardfs.repo
    yum update -y
    yumdownloader --source lizardfs
    yum -y lizardfs-common lizardfs-master lizardfs-cgiserv lizardfs-adm
    cp /var/lib/lizardfs/metadata.mfs.empty /var/lib/lizardfs/metadata.mfs
    cp /usr/share/doc/lizardfs-master/examples/mfsmaster.cfg /etc/lizardfs/mfsmaster.cfg
    sed -i "s/#PERSONALITY = shadow/PERSONALITY = shadow/; s/#MASTER_HOST = 10.142.100.100/MASTER_HOST = 10.142.100.100/; s/#WORKING_USER = lizardfs/WORKING_USER = lizardfs/; s/#WORKING_GROUP = lizardfs/WORKING_GROUP = lizardfs/; s/#EXPORTS_FILENAME = /etc/lizardfs/mfsexports.cfg/EXPORTS_FILENAME = /etc/lizardfs/mfsexports.cfg/; s/#DATA_PATH = /var/lib/lizardfs/DATA_PATH = /var/lib/lizardfs/">>/etc/lizardfs/mfsmaster.cfg
    cp /usr/share/doc/lizardfs-master/examples/mfsexports.cfg /etc/lizardfs/mfsexports.cfg
    cp /usr/share/doc/lizardfs-master/examples/mfsgoals.cfg /etc/lizardfs/mfsgoals.cfg
    sed "s/# 15 default_xor3 : $xor3/15 default_xor3 : $xor3/">>/etc/lizardfs/mfsgoals.cfg
    service lizardfs-master start
    service lizardfs-cgiserv start
}

#                       <---------------------------------------------- Excution du script ------------------------------------------------------------>

install