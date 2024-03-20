#!/bin/bash

if [ "$EUID" -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
fi

if ! command -v apt >/dev/null 2>&1; then
    echo "This script requires apt package manager, which is not available on your system."
    exit 1
fi

apt update
apt install -y dnsutils nmap

ANACONDA_URL="https://repo.anaconda.com/archive/Anaconda3-2024.02-1-Linux-x86_64.sh"  # Fixed Anaconda URL
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR" || exit
curl -O "$ANACONDA_URL"
bash "Anaconda3-2024.02-1-Linux-x86_64.sh" -b -p /opt/anaconda3  # Fixed Anaconda installation script name

USER=$(ls -ld /home/* | awk '{print $3}' | head -n 1)
chown -R "$USER":"$USER" /opt/anaconda3

rm -rf "$TEMP_DIR"

apt install -y bsdgames
apt install -y awscli

echo "Installation completed successfully."

cat <<EOT >> ~/.bashrc
alias cl="clear"
alias ll="ls -al"

export EDITOR=nano
export VISUAL=nano
alias pico='edit'
alias spico='sedit'
alias nano='edit'
alias snano='sedit'
EOT

cp ~/.bashrc /home/ubuntu/dotfiles/.bashrc

ln -sf /home/ubuntu/dotfiles/.bashrc ~/.bashrc

echo "Aliases added to .bashrc, copied to git repository, and symbolic link created successfully."

if [ ! -d ~/.ssh ]; then
    mkdir -p ~/.ssh
fi

cp ~/.ssh/authorized_keys /home/ubuntu/dotfiles/authorized_keys
ln -sf /home/ubuntu/dotfiles/authorized_keys ~/.ssh/authorized_keys

cat <<EOT > ~/.ssh/config
Host fry.cs.wright.edu
    HostName fry.cs.wright.edu
    User W001owk
EOT
ln -sf /home/ubuntu/dotfiles/config ~/.ssh/config 

echo "SSH configuration completed successfully."

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir -p ~/.vim/colors
curl -o ~/.vim/colors/gruvbox.vim https://raw.githubusercontent.com/morhetz/gruvbox/master/colors/gruvbox.vim

git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree

cat <<EOT >> ~/.vimrc
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Plugin to manage plugins
Plugin 'VundleVim/Vundle.vim'

" Color scheme
colorscheme gruvbox

" Vim improvement plugin
Plugin 'preservim/nerdtree'

call vundle#end()
filetype plugin indent on
EOT

echo "Vundle installed and Vim configured."
