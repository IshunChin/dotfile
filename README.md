# dotfile
a dotfile rep

## Mac
```bash
# install requirement
brew install nodejs fzf the_silver_searcher tmux

#cd your working dirctory and run install.sh
bash <(curl -fsSL https://raw.githubusercontent.com/IshunChin/dotfile/master/install.sh)
```


## Docker(ubuntu 19.04)
```bash
git clone https://github.com/IshunChin/dotfile.git
docker build -t dev-ubuntu .
docker run -it dev-ubuntu 

#cd your working dirctory and run install.sh
bash <(curl -fsSL https://raw.githubusercontent.com/IshunChin/dotfile/master/install.sh)
```


## after coc.vim installed
### add python completion
```bash
vim +"CocInstall coc-python" +qall
```

