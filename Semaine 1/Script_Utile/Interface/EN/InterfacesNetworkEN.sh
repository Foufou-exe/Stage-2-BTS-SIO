#!/bin/bash -e
# UTF-8 encoded
#<---- Fonction ---->


function Network { #Create the Network Function which will collect all the Network configuration
    Network_choices=True # Create a variable with the value true
    while [ Network_choices ] # We create a Loop that will allow us to restart the script if desired or in case of error
    do
        read -p "Do you want to configure your network interface? (yes/no):" rep # We ask the user if he wants to configure the network interface if yes we look at the line below if no we exit the script
          if [ $rep = "yes" ] || [ $rep = "y" ] || [ $rep = "YES"] || [ $rep = "Yes"] || [ $rep = "o"] # Condition 1: According to the answer given by the user, if it is yes/y/Oui/o it will continue via the line below
          then
                if [ -e "/etc/systemd/network/01.network" ] # Condition 2: We check that the File 01.network exists if yes we look at the line below
                 then # Then
                 sleep 1 # Wait 1 second
                 echo 'The File already exists 😉' # We'll say that the File already exists according to Condition 2
                 sleep 1 # Wait for 1 second
                 read -p "What name do you want to give your Interface Configuration File? 🙃:" file # We ask the user to give a name for the Configuration file, the variable $file will take the given value
                 touch $file # We create the file which will have for name the value given in $file
                 read -p "Interface name (eth?,enp?s?):" NIF # We ask the user to give a name for the interface and the variable $NIF will take the given value
                 read -p "IP (XXX.XXX.XXX.XXX/YY):" IP # The user is asked to enter a name for the interface and the variable $IP will take the given value
                 read -p "Gateway:" GT # The user is prompted to enter a name for the interface and the variable $GT will be set to the given value
                 read -p "DNS:" DNS # The user is prompted to enter a name for the interface and the variable $DNS is set to the given value
                 echo -e "[Match]\nName=$NIF\n[Network]\nAddress=$IP\nGateway=$GT\nDNS=$DNS" >> /etc/systemd/network/$fichier # Returns a predefined text in File that includes the variables we declared before in a specified path
                 echo "" # Returns a blank
                else # If the file does not exist, look at the line below
                 sleep 1 # Wait 1 second
                 echo "The File does not exist 😣" # We will say that the File does not exist according to Condition 2
                 touch /etc/systemd/network/01.network # Create the file 01.network by default in a specific path
                 sleep 1 # We wait 1 second
                 read -p "Interface name (eth?,enp?s?):" NIF # We ask the user to give a name for the interface and the variable $NIF will take the given value
                 read -p "IP (XXX.XXX.XXX.XXX/YY):" IP # The user is asked to enter a name for the interface and the variable $IP will take the given value
                 read -p "Gateway:" GT # The user is prompted for an interface name and the variable $GT will be set to the given value
                 read -p "DNS:" DNS # The user is prompted to enter a name for the interface and the variable $DNS is set to the given value
                 echo -e "[Match]\nName=$NIF\n[Network]\nAddress=$IP\nGateway=$GT\nDNS=$DNS" >> /etc/systemd/network/$fichier # Returns a predefined text in File that includes the variables we declared before in a specified path
                 echo "" # Returns a blank
                fi # To finish
                 echo "Application on the interface ⏳" # We say that we apply on the interface the modifications/creations we made before
                 sleep 1 # Wait for 1 second
                 systemctl restart systemd-networkd # Restart the systemd-networkd service
                 sleep 2 # Wait 2 seconds
                 echo "The interface is finally configured ✅" # We say that the interface is finally configured
                 sleep 2 # Wait for 2 seconds
                 echo "Here is your interface configuration via $NIF" # We say THE interface configuration via the $NIF variable
                 ip addr show $NIF # Show the interface via the command and the $NIF argument
            else # If not, if the answer is no or no or other than the answers requested, then see the line below
             echo "You are exiting the Interface Setup Menu 👋" # Say you are exiting the Interface Setup Menu
             sleep 1 # Wait 1 second
             echo -e "\nGoodbye👋👋" # Say goodbye
             sleep 2 # Wait for 2 seconds
             exit #Exit the script
            fi #To finish
            read -p "Now that you have finished your configuration, do you want to configure a new interface? (yes/no)🤠:" rep4 #The user is asked if he wants to configure a new interface?
            if [ $rep4 = "no" ] || [ $rep4 = "n" ] || [ $rep4 = "No"] || [ $rep4 = "NO"] || [ $rep4 = "NO"] || [ $rep4 = "N"] # Condition 3 :If the value of $rep4 is No/N/n/No/NON/NO then see the line below
            then # Next
              sleep 2 # We wait 2 seconds
              echo "You are leaving the Interface Setup Menu 👋" # We say we are leaving the Interface Setup Menu
              sleep 1 # Wait for 1 second
              exit # Exit the script
            fi #Finally, if the value of $rep4 in condition 3 is yes/y or other than no then we return to the beginning of the script
  done # Finish
}

function Main { #Create the Main function which will be used to call the other functions
    clear # Delete all messages from before
    # Small ASCII logo
    echo -e "███▄    █ ▓█████ ▄▄▄█████▓ █     █░ ▒█████   ██▀███   ██ ▄█▀\n ██ ▀█   █ ▓█   ▀ ▓  ██▒ ▓▒▓█░ █ ░█░▒██▒  ██▒▓██ ▒ ██▒ ██▄█\n ▓██  ▀█ ██▒▒███   ▒ ▓██░ ▒░▒█░ █ ░█ ▒██░  ██▒▓██ ░▄█ ▒▓███▄░ \n ▓██▒  ▐▌██▒▒▓█  ▄ ░ ▓██▓ ░ ░█░ █ ░█ ▒██   ██░▒██▀▀█▄  ▓██ █▄ \n▒██░   ▓██░░▒████▒  ▒██▒ ░ ░░██▒██▓ ░ ████▓▒░░██▓ ▒██▒▒██▒ █▄\n░ ▒░   ▒ ▒ ░░ ▒░ ░  ▒ ░░   ░ ▓░▒ ▒  ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░▒ ▒▒ ▓▒\n░ ░░   ░ ▒░ ░ ░  ░    ░      ▒ ░ ░    ░ ▒ ▒░   ░▒ ░ ▒░░ ░▒ ▒░\nBy Foufou-exe | BASH | https://github.com/Foufou-exe"
    echo -e "Launching the Interface Configuration Script 😄" #We say we are launching the interface configuration script
    echo " " # Return a blank
    Network # Call the Network function
}

#<------- Running the interface configuration script ------->
Main #Call the Main function to run the script and thus be able to run the other functions