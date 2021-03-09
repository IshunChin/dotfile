### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

# Plugin:zsh-completions
zinit ice wait'0'; zinit light zsh-users/zsh-completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*:default' menu select=1 # 補完候補の一覧表示したとき、Tabや矢印で選択できるようにする

# Plugin:zsh-syntax-highlighting
zinit light zsh-users/zsh-syntax-highlighting

# Plugin:zsh-autosuggestions
zinit light zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

# prompt:starship
eval "$(starship init zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh


# Zsh Option
HISTFILE=$ZDOTDIR/.zsh-history # 履歴保存管理
HISTSIZE=100000
SAVEHIST=1000000
setopt AUTO_CD ## パスを直接入力してもcdする
setopt AUTO_PARAM_KEYS ## 環境変数を補完
EDITOR=nvim

# Aliases
export LSCOLORS=exfxcxdxbxegedabagacad
alias ls="ls ${lsflags} -lG"
alias ll="ls ${lsflags} -lG"
alias la="ls ${lsflags} -laG"

# Locale
export LANG="en_US.UTF-8"

# Enable AWS CLI v2 auto completion
autoload bashcompinit && bashcompinit
complete -C '/usr/local/bin/aws_completer' aws

# nvm 
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# pyenv
eval "$(pyenv init -)"

# rbenv
eval "$(rbenv init -)"
