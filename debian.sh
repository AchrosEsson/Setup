#!/bin/bash

#### Bash-Script zum initialisieren und provisionieren eines neuen Debian-Betriebssystems ####

if [ "$EUID" -ne 0 ]
  then echo "Please run as root'"
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
echo $'\n'
echo 'installiere Tmux'
echo $'\n'
sleep 2

apt-get install -y tmux
echo $'\n'
echo 'installiere Wget'
echo $'\n'
sleep 2

apt-get install -y wget
echo $'\n'
echo 'installiere Curl'
echo $'\n'
sleep 2

apt-get install -y curl
echo $'\n'
echo 'installiere Htop'
echo $'\n'
sleep 2

apt-get install -y htop
echo $'\n'
echo 'installiere Avahi'
echo $'\n'
sleep 2

apt-get install -y avahi-daemon
echo $'\n'
echo 'installiere Speedtest'
echo $'\n'
sleep 2

apt-get install -y speedtest-cli
echo $'\n'
echo 'installiere C-Matrix'
echo $'\n'
sleep 2

apt-get install -y cmatrix
echo $'\n'
echo 'installiere Chromium'
echo $'\n'
sleep 2

apt-get install -y chromium-browser
echo $'\n'
echo 'installiere Firefox'
echo $'\n'
sleep 2

apt-get install -y firefox
echo $'\n'
echo 'installiere G-Parted'
echo $'\n'
sleep 2

apt-get install -y gparted
echo $'\n'
echo 'installiere Z-Shell'
echo $'\n'
sleep 2

apt-get install -y zsh


#### Google Chrome ####
echo $'\n'
echo 'installiere Google-Chrome'
echo $'\n'
sleep 2

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
apt-get -f install
cd $cwd



#### Text Editors ####
echo $'\n'
echo 'installiere Vim'
echo $'\n'
sleep 2

apt-get install -y vim
apt-get install -f
#./atom.sh
#./vscode.sh



echo $'\n'
echo "Möchtest du Visual Studio Code installieren?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) (. ./vscode.sh); break;;
        No ) break;;
    esac
done

echo $'\n'
echo "Möchtest du Software-Properties-Common installieren?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) apt install software-properties-common && apt-get install -f; break;;
        No ) break;;
    esac
done

#### GIT ####
echo $'\n'
echo 'installiere Git'
echo $'\n'
sleep 2

apt-get install -y git
apt-get install -fy
git config --global user.name $git_name
git config --global user.email $git_email
git config --global user.name $git_user
git config --global push.default matching
git config --global core.editor "nano"

echo $'\n'
echo 'Klone GitHub Repository...'
echo $'\n'
sleep 2

git clone https://github.com/AchrosEsson/Scripts.git

sleep 2
echo $'\n'
echo 'Klonen abgeschlossen'
echo $'\n'
sleep 2
echo $'\n'
echo 'Kopiere Tmux-Konfigurationen'
echo $'\n'

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

cd "$parent_path"

cp /Scripts/tmux/tmux.conf /home/user/.tmux.config

sleep 2
echo $'\n'
echo 'Kopiere Z-Shell-Konfigurationen'
echo $'\n'
sleep 2

cp /Scripts/zsh/zshrc /home/user/.zshrc

sleep 2





#### Python Install ####
echo $'\n'
echo "Möchtest du Python installieren?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) (. ./python.sh); break;;
        No ) ;;
    esac
done


#### rsync install ####
echo $'\n'
echo 'installiere rsync'
echo $'\n'
sleep 2

apt-get install -y rsync
apt-get install -f



#### Virutalization ####
echo $'\n'
echo 'installiere Virtualisierungs-Software'
echo $'\n'
sleep 2

echo $'\n'
echo "Möchtest du Virt-Manager installieren?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) apt-get install -y virt-manager  && apt-get install -f; break;;
        No ) break;;
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
#sleep 2


#### konfiguriere Backup ####
echo $'\n'
echo "Möchtest du eine Backup-location bestimmen?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) (. ./backup.sh); break;;
        No ) break;;
    esac
done



#### Finalization ####
echo $'\n'
echo 'Systemeinrichtung abgeschlossen. Viel Spaß!'
echo $'\n'

sleep 2

#echo 'Bitte Shell neustarten!'


exit