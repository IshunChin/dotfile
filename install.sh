#/bin/bash

apt update
apt upgrade -y
apt install -y curl git nodejs npm python3 pipenv
pip3 install -y awscli

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/IshunChin/dotfile.git

ln `pwd`/dotfile/vimrc ~/.vimrc
ln `pwd`/dotfile/tmux.conf ~/.tmux.conf

