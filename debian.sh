#!/bin/bash

#### Bash-Script zum initialisieren und provisionieren eines neuen Debian-Betriebssystems ####

echo $'\n'

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo $'\n'
echo 'initialisiere System...'
echo $'\n'
sleep 2


#### Gather User Data ####

echo 'Einrichten von Git-Login'
echo -n 'Gib deinen Git-Namen ein: '
read git_name
echo -n 'Gib deine GIT-Email ein: '
read git_email
echo -n 'Gib deinen GitHub-Benutzername ein: '
read git_user



#### System Update & Upgrade ####
echo $'\n'
echo 'Vorbereitung...'
echo $'\n'

sleep 2

apt-get update -y
apt-get install -f
apt-get dist-upgrade -y
apt-get autoremove -y



#### Essentials ####
echo $'\n'
echo 'installiere Neofetch'
echo $'\n'

sleep 2

apt-get install -y neofetch

echo 'installiere Tmux'

sleep 2

apt-get install -y tmux

echo 'installiere Wget'

sleep 2

apt-get install -y wget

echo 'installiere Curl'

sleep 2

apt-get install -y curl

echo 'installiere Htop'

sleep 2

apt-get install -y htop

echo 'installiere Avahi'

sleep 2

apt-get install -y avahi-daemon

echo 'installiere Speedtest'

sleep 2

apt-get install -y speedtest-cli

echo 'installiere C-Matrix'

sleep 2

apt-get install -y cmatrix

echo 'installiere Chromium'

sleep 2

apt-get install -y chromium-browser

echo 'installiere Firefox'

sleep 2

apt-get install -y firefox

echo 'installiere G-Parted'

sleep 2

apt-get install -y gparted

echo 'installiere Z-Shell'

sleep 2

apt-get install -y zsh



#### Google Chrome ####
echo 'installiere Google-Chrome'

sleep 2

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
apt-get -f install
cd $cwd



#### Text Editors ####
echo 'installiere Vim'

sleep 2

apt-get install -y vim
apt-get install -f
#./atom.sh
./vscode.sh



#### GIT ####
echo 'installiere Git'

sleep 2

apt-get install -y git
apt-get install -fy
git config --global user.name $git_name
git config --global user.email $git_email
git config --global user.name $git_user
git config --global push.default matching
git config --global core.editor "nano"

echo 'Klone GitHub Repository...'

sleep 2

git clone https://github.com/AchrosEsson/Scripts.git

sleep 2

echo 'Klonen abgeschlossen'

sleep 2

echo 'Kopiere Tmux-Konfigurationen'


parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"

cp /Scripts/tmux/tmux.conf /home/user/.tmux.config

sleep 2

echo 'Kopiere Z-Shell-Konfigurationen'

sleep 2

cp /Scripts/zsh/zshrc /home/user/.zshrc

sleep 2





#### Python Install ####

echo "Möchtest du Python installieren?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) /bin/bash python.sh break;;
        No ) exit;;
    esac
done






#### Configure Backup ####

echo 'install rsync'

sleep 2

apt-get install -y rsync
apt-get install -f

echo "Möchtest du eine Backup-location bestimmen?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) /bin/bash backup.sh; break;;
        No ) exit;;
    esac
done





#### Virutalization ####

echo 'installiere Virtualisierungs-Software'

sleep 2

echo "Möchtest du Virt-Manager installieren?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) apt-get install virt-manager  && apt-get install -f; break;;
        No ) exit;;
    esac
done



#### Installiere Zsh - Prezto ####

#echo 'Installiere Zsh - Prezto'

#sleep 2

# 1. Launch Zsh:
#echo 'Starte Zsh...'
#sleep 2
#zsh 

# 2. Clone the repository:
#echo 'Klone GitHub Repository...'
#sleep 2
#git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# 3. Create a new Zsh configuration by copying the Zsh configuration files provided:
#echo 'erstelle neue Zsh Konfiguration...'
#sleep 2
#setopt EXTENDED_GLOB
#for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
#done

# 4. Set Zsh as your default shell:
#echo 'setze Zsh als Standard-Shell...'
#chsh -s /bin/zsh


#echo 'Zsh erfolgreich installiert'
sleep 2


#### Finalization ####
echo 'Systemeinrichtung abgeschlossen. Viel Spaß!'

sleep 2

#echo 'Bitte Shell neustarten!'


exit