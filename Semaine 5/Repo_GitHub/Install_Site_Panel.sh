#!/bin/bash -e

function verification_apache {
    if [ "$(which apache2 | grep -o apache2)" == "apache2" ]; then 
        echo "Apache2 est deja installer sur le disque !";
    else 
        apt-get install -y apache2
    fi
}

function verification_git {
    if [ "$(which git | grep -o git)" == "git" ]; then 
        echo "git est deja installer sur le disque !";
    else 
        apt-get install -y git
    fi
}

function verification_default_site {
    if [ -f "/etc/apache2/sites-enabled/000-default.conf" ]; then 
        a2dissite 000-default.conf
        systemctl reload apache2
    else 
         echo "Le site par default est deja desactiver !";
    fi
}

function Virtual_host {
    if [ ! -f "/etc/apache2/sites-available/panel-dataheberg-home.conf" ]; then
        echo -e "<VirtualHost *:80>\nDocumentRoot /var/www/dataheberg.home/panel\nServerName www.dataheberg.home\n</VirtualHost>" > /etc/apache2/sites-available/panel-dataheberg-home.conf
        a2ensite panel-dataheberg-home
        systemctl reload apache2
    else
        echo "Le fichier panel-dataheberg-home est deja cree !!! "
    fi
}

function install {
    echo "Verification d'apache"
    verification_apache
    echo "Verification de git"
    verification_git
    echo "Verification et suppression default site"
    verification_default_site
    echo "Verication / creation dossier Virtual Host"
    Virtual_host
    update
}

function update {
    echo "Installation/Update du Site panel "
    sleep 2
    if [ ! -d "/var/www/dataheberg.home/" ]; then 
        mkdir -p /var/www/dataheberg.home/panel;
    fi
    rm -rf /var/www/dataheberg.home/panel
    cd /var/www/dataheberg.home
    git clone https://dataheberg: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@github.com/Dataheberg/panel.git
    systemctl reload apache2
}

install