#!/bin/bash

debugPrint() {
    bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "$1"
}

checkApp() {
    if ! [ -x "$(command -v $1)" ]; then
        debugPrint "$1 is not installed"
        return 1
    fi
    debugPrint "$1 is installed"
    return 0
}

checkDir() {
    if [ -d "$1" ]; then
        debugPrint "$1 exists"
        return 1
    fi
    debugPrint "$1 does not exist"
    return 0
}

checkFile() {
    if [ -f "$1" ]; then
        debugPrint "$1 exists"
        return 1
    fi
    debugPrint "$1 does not exist"
    return 0
}

install() {
    bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/install/$1.sh
}

debugPrint "Bootstraping MacOS"

debugPrint "Unlink oh my zsh"
rm -rf "$HOME/.oh-my-zsh"

debugPrint "Install oh-my-zsh"
checkDir "$HOME/.oh-my-zsh" && git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"

debugPrint "Install zsh-autosuggestions"
checkDir "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" && git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

debugPrint "Install zsh-syntax-highlighting"
checkDir  "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" && git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

debugPrint "Link .zshrc and .gitconfig"
checkFile "$HOME/.zshrc" && ln -s "$(pwd)/.zshrc_macos" "$HOME/.zshrc"
checkFile "$HOME/.gitconfig" && ln -s "$(pwd)/.gitconfig" "$HOME/.gitconfig"

chsh -s $(which zsh)