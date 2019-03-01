#!/bin/bash

if [ $(uname) == "Darwin" ] #macOS installation
then
    if [ -f /usr/local/bin/easygit ] #check if already installed
    then
        echo -e "EasyGit is already installed. Run it at any time using 'easygit'."
        
    else #not installed, continue installing
        echo -e "\nDo you want to continue installation? Y/N"
        read choice
        
        if [ $choice == "Y" -o $choice == "y" ]
        then
            echo -e "Installing..."
            cp easygit.sh /usr/local/bin #copies file to /usr/local/bin
            mv /usr/local/bin/easygit.sh /usr/local/bin/easygit #removes file extension
            chmod +x /usr/local/bin/easygit #makes it an executable
            echo -e "Installation complete. Run the program at any time using 'easygit'."
            
        else
            echo -e "Installation aborted."
        fi
    fi
    
else
    echo -e "Installation on Linux not yet supported (send PR!)"
fi