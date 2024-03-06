#!/bin/bash

bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Bootstraping MacOS"

bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Unlink existing zsh"
rm -rf "$HOME/.oh-my-zsh"

# unlink existing before install
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Unlink existing .zshrc and .gitconfig"
rm -rf "$HOME/.zshrc" \
    "$HOME/.zshrc.pre-oh-my-zsh*"\
    "$HOME/.gitconfig"

# link
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Link .zshrc and .gitconfig"
ln -s "$(pwd)/.zshrc_macos" "$HOME/.zshrc"
ln -s "$(pwd)/.gitconfig" "$HOME/.gitconfig"

brew bundle --file=Brewfile