#!/usr/bin/env bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.vim/plugged
git clone https://github.com/crusoexia/vim-monokai.git ~/.vim/plugged/vim-monokai

git clone https://github.com/IshunChin/dotfile.git
ln `pwd`/dotfile/vimrc ~/.vimrc
ln `pwd`/dotfile/tmux.conf ~/.tmux.conf

vim +PlugInstall +qall
