#!/bin/bash

apt-get update -y
apt-get upgrade -y

# Theming
#add-apt-repository ppa:numix/ppa
#apt-get update -y
#apt-get install numix-icon-theme -y

# Essentials
apt-get install irssi -y
apt-get install python3 -y
apt-get install python3-pip -y
pip3 install rtv
apt-get install tmux -y
apt-get install git -y
apt-get install whois -y
apt-get install convert -y
apt-get install htop -y
apt-get install glances -y
apt-get install libreoffice -y
apt-get install xclip -y
apt-get install tree -y
apt-get install acct -y
apt-get install curl -y
apt-get install traceroute -y
apt-get install ffmpeg -y
apt-get install pandoc -y

# Vim setup
apt-get install vim -y
mkdir ~/.vim/ && cd ~/.vim
git clone https://github.com/zcodes/vim-colors-basic.git && mv -r vim-colors-basic/colors/ .
rm -rf vim-colors-basic/

mkdir autoload bundle && \
curl -LSso autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/itchyny/lightline.vim bundle/lightline.vim

# Dotfiles
cd ~
git clone https://github.com/madsaune/dotfiles.git
ln -s dotfiles/vim/.vimrc ~/.vimrc && ln -s dotfiles/irssi .irssi

# Youtube-dl
curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
if [ $? -eq 0 ]; then
    echo "Youtube-dl successfully installed"
else
    echo "Youtube-dl was not installed"
fi
# Terminal colors : base16 xfce4


# Markdown to PDF
#apt-get install rubygems -y
#apt-get install wkhtmltopdf -y
#apt-get install zlib1g-dev -y
#gem install gimli
