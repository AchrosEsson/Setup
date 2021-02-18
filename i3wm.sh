#!/bin/bash

#### Bash-Script zur installation von i3-Gaps ####

echo $'\n'
echo 'installiere i3-Gaps'
echo $'\n'
echo 'installiere Abhängigkeiten...'
echo $'\n'
sleep 2

sudo apt install -y libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxcb-xrm-dev libxkbcommon-x11-dev autoconf xutils-dev libtool automake


echo $'\n'
echo 'installiere i3'
echo $'\n'
sleep 2

cd /tmp

echo $'\n'
echo 'Holen von i3-gaps...'
echo $'\n'

git clone https://www.github.com/Airblader/i3 i3-gaps

absolutepath="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")"

cd $absolutepath/i3-gaps

git checkout gaps && git pull

echo $'\n'
echo 'Aktualisieren von Konfigurationsdateien...'
echo $'\n'

autoreconf --force --install

rm -rf build

absolutepath1="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")"

mkdir $absolutepath1/build

cd $absolutepath1/build

../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers

echo $'\n'
echo 'Vorbereiten der Installation...'
echo $'\n'

make

echo $'\n'
echo 'Installiere i3-gaps...'
echo $'\n'

sudo make install

echo $'\n'
echo 'i3 wurde erfolgreich installiert, kehre zurück...'
echo $'\n'

sleep 3

exit