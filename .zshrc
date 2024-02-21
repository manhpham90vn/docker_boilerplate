export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

[ -z "$TMUX" ] && tmux
[ -n "$TMUX" ] && export TERM=xterm-256color
