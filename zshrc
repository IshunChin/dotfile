#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# common setting
HISTFILESIZE=10000

# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#
# pipenv
#
export PIPENV_VENV_IN_PROJECT=1

#
# Editors
#
export EDITOR='vim'
export VISUAL='vim'
