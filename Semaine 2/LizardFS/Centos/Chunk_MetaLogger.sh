#!bin/bash

#                       <---------------------------------------------- Appelle des Fonctions ----------------------------------------------------->

function install {
    yum  install -y lizardfs-metalogger 
    cp /usr/share/doc/lizardfs-metalogger/examples/mfsmetalogger.cfg /etc/lizardfs/mfsmetalogger.cfg
    echo "LIZARDFSMETALOGGER_ENABLE=true">>/etc/default/lizardfs-metalogger
    service lizardfs-metalogger start
}

#                       <---------------------------------------------- Excution du script ------------------------------------------------------------>

install