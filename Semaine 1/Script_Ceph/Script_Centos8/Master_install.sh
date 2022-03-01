#!/bin/bash -e

#                       <---Fichier Host--->

echo -e "\n10.0.5.201 master dataheberg-master dataheberg-master.localhost\n10.0.5.202 node1 dataheberg-node1 dataheberg-node1.localhost\n10.0.5.203 node2 dataheberg-node2 dataheberg-node2.localhost" >>/etc/hosts

#                       <---Etape 1 via juste le MASTER--->

hostname master
ssh node1 hostname node1
ssh node2 hostname node2
ssh-keygen
ssh-copy-id node1
ssh-copy-id node2

#                       <---Etape 2 via le MASTER--->

dnf update -y; dnf upgrade -y
dnf install -y python3 lvm2 podman curl

#                       <---Etape 3 via le MASTER--->

curl --silent --remote-name --location https://github.com/ceph/ceph/raw/pacific/src/cephadm/cephadm
chmod +x cephadm
./cephadm add-repo --release pacific
./cephadm install
dnf install -y ceph-commo
which cephadm

#                       <---Etape 4 via le MASTER--->

cephadm bootstrap --mon-ip 
#Return l'address du dashboard https://exemple.com:8443/ ainsi l'user : admin password : ??????

#                       <---Etape 5 via le MASTER--->

ceph -v
ceph -s
podman ps

#                       <---Etape 6 via le MASTER--->

ssh-copy-id -f -i /etc/ceph/ceph.pub root@node1
ssh-copy-id -f -i /etc/ceph/ceph.pub root@node2

#                       <---Etape 7 via le MASTER--->

ceph orch host add node1 {$Ip}
ceph orch host add node2 {$Ip}

#                       <---Etape 8 via le MASTER--->

ceph orch host ls
ceph orch device ls
ceph orch apply osd --all-available-devices
ceph -s
ceph osd tree

#                       <---Etape 9 via le MASTER--->

ceph orch apply mon --placement="node1,node2,master"
ceph orch ps | grep mon
ceph orch apply mgr --placement="node1,node2,master"
ceph orch ps | grep mgr

#                       <---Etape 10 via le MASTER--->

ceph orch host label add node1 osd-node
ceph orch host label add node2 osd-node
ceph orch host label add master osd-node

