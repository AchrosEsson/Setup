#!/bin/bash

#### Bash-Script zum Konfigureieren eines Backup ####

echo -n 'Enter your desired Backup destination: ' 
        read backup-location
        echo "rsync -zrvh /home $backup-location" >> ~/.zshrc

exit