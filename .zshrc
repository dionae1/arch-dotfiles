export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8

ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode reminder

plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

### ALIASES ###

alias dfconfig='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Pywal start setup
(cat ~/.cache/wal/sequences &)

# Fastfetch on session start
if [ -n "$PS1" ] && [ -x "$(command -v fastfetch)" ]; then
	fastfetch
fi

