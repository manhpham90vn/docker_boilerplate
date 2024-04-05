#!/bin/bash

BREW_CASKROOM_DIR="/usr/local/Caskroom"

checkDir() {
    if ! [ -d $BREW_CASKROOM_DIR/$1 ]; then
        echo "Dir $1 is not found"
        return 1
    else
        echo "$1 already exists"
        return 0
    fi
}

checkCommand() {
    if ! (type $1 > /dev/null 2>&1); then
        echo "Installing $1"
        return 1
    else
        echo "$1 already installed"
        return 0
    fi
}

checkIsFormulaeInstalled() {
    if ! (brew list $1 > /dev/null 2>&1); then
        echo "Installing $1"
        return 1
    else
        echo "$1 already installed"
        return 0
    fi
}

checkCommand "brew" || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
checkDir "google-chrome" || brew install --cask google-chrome
checkDir "android-studio" || brew install --cask android-studio
checkDir "visual-studio-code" || brew install --cask visual-studio-code
checkDir "docker" || brew install --cask docker
checkDir "sourcetree" || brew install --cask sourcetree
checkDir "iterm2" || brew install --cask iterm2
checkDir "datagrip" || brew install --cask datagrip
checkDir "postman" || brew install --cask postman
checkDir "charles" || brew install --cask charles
checkDir "openvpn-connect" || brew install --cask openvpn-connect
checkDir "virtualbox" || brew install --cask virtualbox
checkIsFormulaeInstalled "xcodes" || brew install xcodesorg/made/xcodes
checkIsFormulaeInstalled "rbenv" || brew install rbenv
checkIsFormulaeInstalled "nvm" || brew install nvm
checkIsFormulaeInstalled "pyenv" || brew install pyenv
rm -rf "$HOME/.oh-my-zsh"
git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
rm -rf "$HOME/.zshrc" "$HOME/.gitconfig"
ln -s "$(pwd)/configs/.zshrc" "$HOME/.zshrc"
ln -s "$(pwd)/configs/.gitconfig" "$HOME/.gitconfig"