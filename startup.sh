#!/usr/bin/env bash
if [ ! -e ~/.vimrc ]; then
    bash <(curl -fsSL https://raw.githubusercontent.com/IshunChin/dotfile/master/install.sh)
exec /bin/bash
fi
