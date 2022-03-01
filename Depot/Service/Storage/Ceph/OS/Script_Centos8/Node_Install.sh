#!/bin/bash -e

#                       <---Fichier Host--->

echo -e "\n10.0.5.201 master dataheberg-master dataheberg-master.localhost\n10.0.5.202 node1 dataheberg-node1 dataheberg-node1.localhost\n10.0.5.203 node2 dataheberg-node2 dataheberg-node2.localhost" >>/etc/hosts

#                       <---Unique Etape via les NODES--->

dnf update -y; dnf upgrade -y
dnf install -y python3 lvm2 podman curl