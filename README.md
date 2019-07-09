# dotfile
a dotfile rep

# vimrc requirement
### vim-plug
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

### Docker(ubuntu 19.04)でお試し
```bash
git clone https://github.com/IshunChin/dotfile.git
docker build -t dev-ubuntu .
docker run -it dev-ubuntu /tmp/install.sh
```
