#!/bin/bash

#MASTER

#<---Fichier Host--->
sed -i "12i10.0.5.11  dataheberg-master salt master dataheberg-master.localhost\n10.0.5.13  dataheberg-node1 node1  dataheberg-node1.localhost\n10.0.5.12  dataheberg-node2 node2  dataheberg-node2.localhost"

#<---Install--->
export DEV_ENV=true
zypper install -y git curl wget make sudo make ntp
systemctl enable ntpd.service
systemctl start ntpd.service
zypper in salt-master salt-minion
systemctl stop apparmor.service
systemctl disable apparmor.service
systemctl enable salt-master.service
systemctl start salt-master.service
firewall-cmd --permanent --zone=public --add-port=4505-4506/tcp
firewall-cmd --reload
systemctl enable salt-minion.service
systemctl start salt-minion.service
salt-call --local key.finger
#sleep 60
salt-key -F
salt-key --accept-all
salt-key --list-all