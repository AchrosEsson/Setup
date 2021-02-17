#!/bin/bash

#### Bash-Script zum Konfigureieren eines Backup ####
echo $'\n'
echo -n 'Enter your desired Backup destination: ' 
echo $'\n'
        read backup_location
        touch ~/.zshrc
        echo "rsync -zrvh /home $backup_location" >> ~/.zshrc

echo $'\n'
echo -n 'Backup einrichtung Abgeschlossen ' 
echo $'\n'

exit