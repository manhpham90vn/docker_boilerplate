#!/bin/bash

# unlink
rm -rf "$HOME/.oh-my-zsh" \
    "$HOME/.zshrc" \
    "$HOME/.gitconfig"

source $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/update-submodules.sh

# link
ln -s "$(pwd)/.oh-my-zsh" "$HOME/.oh-my-zsh"
ln -s "$(pwd)/.zsh-autosuggestions" "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
ln -s "$(pwd)/.zsh-syntax-highlighting" "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"
ln -s "$(pwd)/.zshrc" "$HOME/.zshrc"
ln -s "$(pwd)/.gitconfig" "$HOME/.gitconfig"
ln -s "$(pwd)/.tmux.conf" "$HOME/.tmux.conf"

# install brew
brew bundle --file=Brewfile