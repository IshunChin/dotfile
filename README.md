# dotfile
a dotfile rep

# vimrc requirement
### vim-plug
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```


### colorscheme
```bash
mkdir ~/.vim/colors
git clone https://github.com/tomasr/molokai
ln -s ~/.vim/colors/molokai/molokai.vim ~/.vim/colors/molokai.vim
```

### vimrc coc.nvim
```bash
brew install nodejs

# check config file
CocConfig

# show doc
h coc-status
```

### vimrc fzf
```bash
brew install fzf
brew install the_silver_searcher
```
