#/bin/bash

apt update
apt upgrade -y
apt install -y curl git nodejs npm python3 pipenv python3-pip fzf silversearcher-ag vim
pip3 install awscli

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir ~/.vim/plugged
git clone https://github.com/IshunChin/dotfile.git
git clone https://github.com/crusoexia/vim-monokai.git ~/.vim/plugged/vim-monokai

ln `pwd`/dotfile/vimrc ~/.vimrc
ln `pwd`/dotfile/tmux.conf ~/.tmux.conf


vim +PlugInstall +qa
vim +CocInstall coc-python coc-json
