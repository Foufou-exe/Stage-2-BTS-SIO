#!/bin/bash
#MASTER
zypper install -y git curl wget make sudo make ntp
git clone https://github.com/SUSE/DeepSea.git
cd DeepSea
make install
zypper ar http://download.opensuse.org/repositories/filesystems:/ceph:/luminous/openSUSE_Leap_42.3/filesystems:ceph:luminous.repo
zypper refresh
systemctl enable ntpd.service
systemctl start ntpd.service
systemctl disable apparmor.service
systemctl disable SuSEfirewall2.service
systemctl disable firewall
zypper install deepsea
systemctl enable salt-master.service
systemctl start salt-master.service
touch /etc/salt/minion.d/master.conf
echo "master: master" >>/etc/salt/minion.d/master.conf
systemctl restart salt-minion.service
nano /srv/pillar/ceph/master_minion.sls