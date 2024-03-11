#!/bin/bash

aptAppList=(
    "git"
    "zsh"
    "vim"
    "curl"
    "wget"
    "tree"
)

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
    bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/$1.sh
}

debugPrint "Bootstraping Ubuntu"

debugPrint "Update system"
sudo apt update && sudo apt upgrade -y

debugPrint "Install tools"

for app in "${aptAppList[@]}"; do
    checkApp "$app" || sudo apt install -y $app
done

debugPrint "Unlink existing zsh and gitconfig files"
rm -rf "$HOME/.oh-my-zsh" \
    "$HOME/.zshrc" \
    "$HOME/.zshrc.pre-oh-my-zsh*" \
    "$HOME/.zsh-autocomplete" \
    "$HOME/.gitconfig"

debugPrint "Install oh-my-zsh"
checkDir "$HOME/.oh-my-zsh" && git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh"

debugPrint "Install zsh-autosuggestions"
checkDir "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" && git clone --depth 1 https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

debugPrint "Install zsh-syntax-highlighting"
checkDir  "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" && git clone --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

debugPrint "Install zsh-autocomplete"
checkDir "$HOME/.zsh-autocomplete" && git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git "$HOME/.zsh-autocomplete"

debugPrint "Link .zshrc and .gitconfig"
checkFile "$HOME/.zshrc" && ln -s "$(pwd)/.zshrc_ubuntu" "$HOME/.zshrc"
checkFile "$HOME/.gitconfig" && ln -s "$(pwd)/.gitconfig" "$HOME/.gitconfig"

debugPrint "Install docker"
checkApp "docker" || install "docker"

debugPrint "Install docker-compose"
checkApp "docker-compose" || install "docker-compose"

debugPrint "Install pyenv"
checkApp "pyenv" || install "pyenv"

debugPrint "Install terraform"
checkApp "terraform" || install "terraform"

debugPrint "Install kubectl"
checkApp "kubectl" || install "kubectl"

debugPrint "Install helm"
checkApp "helm" || install "helm"

debugPrint "Install ansible"
checkApp "ansible" || install "ansible"

# install aws cli
# install sam cli
# install eb cli
# install gvm
# install nginx
# install nvm
# install rbenv
# install mysql
# install postgres
# install redis
# install mongodb
# install vagrant
# install virtualbox
# install datagrip

debugPrint "Install minikube"
checkApp "minikube" || install "minikube"

debugPrint "Install vscode"
checkApp "code" || install "vscode"

debugPrint "Install chrome"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp
sudo apt install /tmp/google-chrome-stable_current_amd64.deb

debugPrint "Docker post-installation"
sudo usermod -aG docker $USER
newgrp docker

debugPrint "Change default shell to zsh"
chsh -s $(which zsh)