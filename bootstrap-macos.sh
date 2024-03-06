#!/bin/bash

bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Bootstraping MacOS"

bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Unlink existing zsh"
rm -rf "$HOME/.oh-my-zsh"

# https://ohmyz.sh/#install
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install oh-my-zsh"
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# https://github.com/marlonrichert/zsh-autocomplete?tab=readme-ov-file#manual-installation
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install zsh-autocomplete"
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh-autocomplete

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