#!/bin/bash

#NODE

#<---Fichier Host--->
sed -i "12i10.0.5.11  dataheberg-master salt master dataheberg-master.localhost\n10.0.5.13  dataheberg-node1 node1  dataheberg-node1.localhost\n10.0.5.12  dataheberg-node2 node2  dataheberg-node2.localhost"

#<---Install--->
export DEV_ENV=true
zypper install -y git curl wget make sudo make ntp
zypper in salt-minion
sleep 30
systemctl enable salt-minion.service
systemctl start salt-minion.service
salt-call --local key.finger