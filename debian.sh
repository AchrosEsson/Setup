#!/bin/ba

#### Bash-Script zum initialisieren und provisionieren eines neuen Debian-Betriebssystems ####
echo 'initialisiere System...'

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
echo 'Vorbereitung...'
apt-get update -y
apt-get install -f
apt-get dist-upgrade -y
apt-get autoremove -y



#### Essentials ####
echo 'installiere Neofetch'
apt-get install -y neofetch

echo 'installiere Tmux'
apt-get install -y tmux

echo 'installiere Wget'
apt-get install -y wget

echo 'installiere Curl'
apt-get install -y curl

echo 'installiere Htop'
apt-get install -y htop

echo 'installiere Avahi'
apt-get install -y avahi-daemon

echo 'installiere Speedtest'
apt-get install -y speedtest-cli

echo 'installiere C-Matrix'
apt-get install -y cmatrix

echo 'installiere Chromium'
apt-get install -y chromium-browser

echo 'installiere Firefox'
apt-get install -y firefox

echo 'installiere G-Parted'
apt-get install -y gparted

echo 'installiere Z-Shell'
apt-get install -y zsh



#### Google Chrome ####
echo 'installiere Google-Chrome'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
apt-get -f install
cd $cwd



#### Text Editors ####
echo 'installiere Vim'
apt-get install -y vim
apt-get install -f
#./atom.sh
./vscode.sh



#### GIT ####
echo 'installiere Git'
apt-get install -y git
apt-get install -fy
git config --global user.name $git_name
git config --global user.email $git_email
git config --global user.name $git_user
git config --global push.default matching
git config --global core.editor "nano"

echo 'Klone GitHub Repository...'

git clone https://github.com/AchrosEsson/Scripts.git

echo 'Klonen abgeschlossen'

echo 'Kopiere Tmux-Konfigurationen'

cp /Scripts/tmux/tmux.conf /home/user/.tmux.config

echo 'Kopiere Z-Shell-Konfigurationen'

cp /Scripts/zsh/zshrc /home/user/.zshrc

sleep 2





#### Python Install ####
echo "Installiere Python"

apt-get install -y python3-pip
apt-get install -f
apt-get install -y python3-venv
apt-get install -f



#### Configure Backup ####
apt-get install -y rsync
apt-get install -f

echo "Möchtest du eine Backup-location bestimmen?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo -n 'Enter your desired Backup destination: ' && read backup-location && echo "rsync -zrvh /home $backup-location" >> ~/.zshrc; break;;
        No ) exit;;
    esac
done



#### Virutalization ####
echo "Möchtest du Virtualbox installieren?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) apt-get install -y virtualbox virtualbox-qt && apt-get install -f; break;;
        No ) exit;;
    esac
done



#### Installiere ZSH - Prezto ####

echo "Installiere ZSH - Prezto"


# 1. Launch Zsh:
zsh

# 2. Clone the repository:
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# 3. Create a new Zsh configuration by copying the Zsh configuration files provided:
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# 4. Set Zsh as your default shell:
chsh -s /bin/zsh



#### Finalization ####
echo 'Systemeinrichtung abgeschlossen. Viel Spaß!'

sleep 2

echo 'Bitte Shell neustarten!'
