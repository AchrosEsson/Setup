#!/bin/bash

#### Bash-Script zur installation von i3-Gaps ####

echo $'\n'
echo 'installiere i3-Gaps'
echo $'\n'
echo 'Füge das i3-gaps Repository zum System hinzu'
echo $'\n'
sleep 2

add-apt-repository ppa:simon-monette/i3-gaps
apt-get update

echo $'\n'
echo 'installiere i3...'
echo $'\n'

apt-get install -y i3-gaps
apt-get install -f

echo $'\n'
echo 'i3 wurde erfolgreich installiert, kehre zurück...'
echo $'\n'

sleep 3

exit

