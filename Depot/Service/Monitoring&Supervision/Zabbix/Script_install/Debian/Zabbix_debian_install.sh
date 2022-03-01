#!/bin/bash

apt install build-essential libmariadb-dev sudo libxml2-dev snmp libsnmp-dev libcurl4-openssl-dev php-gd php-xml php-bcmath php-mbstring vim libevent-dev libpcre3-dev libxml2-dev libmariadb-dev libapache2-mod-php libopenipmi-dev pkg-config php-ldap php-mysql apache2 php mariadb-server snmp curl git python3 python3-pip-y
apt update -y && apt upgrade -y
wget https://repo.zabbix.com/zabbix/5.4/debian/pool/main/z/zabbix-release/zabbix-release_5.4-1+debian11_all.deb
dpkg -i zabbix-release_5.4-1+debian11_all.deb
apt update
apt install zabbix-server-mysql zabbix-frontend-php zabbix-apache-conf zabbix-sql-scripts zabbix-agent -y
mysql -u root
mysql> create database zabbix character set utf8 collate utf8_bin;
mysql> create user zabbix@localhost identified by 'password';
mysql> grant all privileges on zabbix.* to zabbix@localhost;
mysql> quit;
zcat /usr/share/doc/zabbix-sql-scripts/mysql/create.sql.gz | mysql -uzabbix -p zabbixEdit file /etc/zabbix/zabbix_server.conf
nano /etc/zabbix/zabbix_server.conf
DBPassword="Mot de passe Base de donne"
systemctl restart zabbix-server zabbix-agent apache2
systemctl enable zabbix-server zabbix-agent apache2
