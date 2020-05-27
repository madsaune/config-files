#!/bin/bash

apt-get update -y
apt-get upgrade -y

# Standard folders

mkdir ~/code

# Essential programs
apt install -y \
  git \
  curl \
  xclip \
  whois \
  htop \
  glances \
  tree \
  acct \
  traceroute \
  ffmpeg \
  pandoc \
  evolution \
  software-properties-common \
  apt-transport-https \
  wget \
  keepassxc \
  ca-certificates \
  apt-transport-https \
  lsb-release \
  gnupg

# Install NodeJS
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install VIM
apt install vim
git clone git@github.com:madsaune/dotfiles.git
ln -s ~/code/dotfiles/vim/.vimrc ~/.vimrc
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim vim +PluginInstall +qall

# Install irssi
apt install irssi
cd ~
ln -s ~/code/dotfiles/irssi .irssi

# Youtube-dl
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
if [ $? -eq 0 ]; then
  echo "Youtube-dl successfully installed"
else
  echo "Youtube-dl was not installed"
fi

# Install Spotify client
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# Install Visual Studio Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt update && apt install code

# Install Google Chrome
cd ~/Nedlastinger
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb
rm ./google-chrome-stable_current_amd64.deb

# Install Microsoft Teams
cd ~/Nedlastinger
wget "https://packages.microsoft.com/repos/ms-teams/pool/main/t/teams/teams_1.3.00.5153_amd64.deb"
apt install ./teams_1.3.00.5153_amd64.deb
rm ./teams_1.3.00.5153_amd64.deb

# Install Citrix Workspace App
cd ~/Nedlastinger
wget -O "icaclient_20.04.0.21_amd64.deb" "https://downloads.citrix.com/17780/icaclient_20.04.0.21_amd64.deb?__gda__=1590564303_2a77fcf777a35520a1a8cf5d87142662"
apt install ./icaclient_20.04.0.21_amd64.deb
rm ./icaclient_20.04.0.21_amd64.deb

# Install Azure CLI
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/microsoft.asc.gpg > /dev/null
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
apt update
apt install azure-cli

# Finalize
apt update && apt upgrade -y


# Manual steps

echo "# ---------------------------------------------"
echo "# MANUAL STEPS"
echo "# ---------------------------------------------"
echo ""
echo "# Window Manager"
echo "1. Open Settings -> Windows Manager"
echo "2. Select 'Keyboard' tab"
echo "3. Set 'Maximize Window' to 'Super+Return'"
echo "4. Set 'Set Window at top left' to 'Super+U'"
echo "5. Set 'Set window at top right' to 'Super+I'"
echo "6. Set 'Set window at bottom left' to 'Super+J'"
echo "6. Set 'Set window at bottom right' to 'Super+K'"
echo ""

