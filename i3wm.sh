#!/bin/bash

#### Bash-Script zur installation von i3-Gaps ####

echo $'\n'
echo 'installiere i3-Gaps'
echo $'\n'
sleep 2

echo $'\n'
echo 'Klone Repository...'
echo $'\n'

git clone https://github.com/maestrogerardo/i3-gaps-deb.git

absolutepath="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")"

cd $absolutepath/i3-gaps-deb

(. ./i3-gaps-deb)

echo $'\n'
echo 'i3 wurde erfolgreich installiert, kehre zurück...'
echo $'\n'

sleep 3

exit

