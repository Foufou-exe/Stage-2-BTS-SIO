#!/bin/bash -e

#<----------------- FONCTION ----------------->

function main() {
   read -n2 -p "Choisi ta langue/Choose your language (FR/EN):" rep
   if [ $rep = "FR" ]; then
      bash ~/Interface/FR/InterfacesNetworkFR.sh
      exit
   elif [ $rep = "EN" ]; then
      bash ~/Interface/EN/InterfacesNetworkEN.sh
      exit
   fi
      echo -e "/nError: Choose your language,retry"
      main
}

#<----------------- DECLARATION FONCTION ----------------->

main
