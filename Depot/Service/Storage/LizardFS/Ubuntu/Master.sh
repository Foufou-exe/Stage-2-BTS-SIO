#!/bin/bash -e

#                       <---------------------------------------------- Appelle des Fonctions ----------------------------------------------------->

function install {
    sudo apt install -y lizardfs-common lizardfs-master lizardfs-cgi lizardfs-adm
    sudo cp /var/lib/lizardfs/metadata.mfs.empty /var/lib/lizardfs/metadata.mfs
    sudo cp /usr/share/doc/lizardfs-master/examples/mfsmaster.cfg /etc/lizardfs/mfsmaster.cfg
    sed -i "s/#PERSONALITY = master/PERSONALITY = master/; s/#WORKING_USER = lizardfs/WORKING_USER = lizardfs/; s/#WORKING_GROUP = lizardfs/WWORKING_GROUP = lizardfs/; s/#EXPORTS_FILENAME = /etc/lizardfs /mfsexports.cfg/EXPORTS_FILENAME = /etc/lizardfs/mfsexports.cfg/; s/#DATA_PATH = /var/lib/lizardfs /DATA_PATH = /var/lib/lizardfs /" >>/etc/lizardfs/mfsmaster.cfg
    sudo cp /usr/share/doc/lizardfs-master/examples/mfsexports.cfg /etc/lizardfs/mfsexports.cfg
    sudo cp /usr/share/doc/lizardfs-master/examples/mfsgoals.cfg /etc/lizardfs/mfsgoals.cfg
    sed "s/# 15 default_xor3 : $xor3/15 default_xor3 : $xor3/">>/etc/lizardfs/mfsgoals.cfg
    sudo service lizardfs-master start
    sudo service lizardfs-cgi start

}

#                       <---------------------------------------------- Excution du script ------------------------------------------------------------>

install