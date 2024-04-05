#!/bin/bash

BREW_CASKROOM_DIR="/usr/local/Caskroom"

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

checkCommand "git" || exit 1
checkCommand "brew" || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
checkIsFormulaeInstalled "google-chrome" || brew install --cask google-chrome
checkIsFormulaeInstalled "android-studio" || brew install --cask android-studio
checkIsFormulaeInstalled "visual-studio-code" || brew install --cask visual-studio-code
checkIsFormulaeInstalled "docker" || brew install --cask docker
checkIsFormulaeInstalled "sourcetree" || brew install --cask sourcetree
checkIsFormulaeInstalled "iterm2" || brew install --cask iterm2
checkIsFormulaeInstalled "datagrip" || brew install --cask datagrip
checkIsFormulaeInstalled "postman" || brew install --cask postman
checkIsFormulaeInstalled "charles" || brew install --cask charles
checkIsFormulaeInstalled "openvpn-connect" || brew install --cask openvpn-connect
checkIsFormulaeInstalled "virtualbox" || brew install --cask virtualbox
checkIsFormulaeInstalled "xcodes" || brew install xcodesorg/made/xcodes
checkIsFormulaeInstalled "rbenv" || brew install rbenv
checkIsFormulaeInstalled "nvm" || brew install nvm
checkIsFormulaeInstalled "pyenv" || brew install pyenv
checkIsFormulaeInstalled "goenv" || brew install goenv
checkIsFormulaeInstalled "fvm" || (brew tap leoafarias/fvm && brew install fvm)
checkIsFormulaeInstalled "awscli" || brew install awscli
checkIsFormulaeInstalled "aws-sam-cli" || brew install aws-sam-cli
checkIsFormulaeInstalled "aws-elasticbeanstalk" || brew install aws-elasticbeanstalk
checkIsFormulaeInstalled "google-cloud-sdk" || brew install --cask google-cloud-sdk
checkIsFormulaeInstalled "cloud-sql-proxy" || brew install cloud-sql-proxy
checkIsFormulaeInstalled "terraform" || (brew tap hashicorp/tap && brew install hashicorp/tap/terraform)
checkIsFormulaeInstalled "ansible" || brew install ansible
checkIsFormulaeInstalled "kubectl" || brew install kubectl
checkIsFormulaeInstalled "helm" || brew install helm
checkIsFormulaeInstalled "minikube" || brew install minikube
rm -rf "$HOME/.oh-my-zsh"
git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"
git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
rm -rf "$HOME/.zshrc" "$HOME/.gitconfig"
ln -s "$(pwd)/configs/.zshrc" "$HOME/.zshrc"
ln -s "$(pwd)/configs/.gitconfig" "$HOME/.gitconfig"