#!/bin/bash

source $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/common.sh

aptAppList=(
    "git"
    "zsh"
    "vim"
    "curl"
    "wget"
    "tree"
)

debugPrint "Bootstraping Ubuntu"

debugPrint "Update system"
sudo apt update && sudo apt upgrade -y

debugPrint "Install tools"

for app in "${aptAppList[@]}"; do
    checkApp "$app" || sudo apt install -y $app
done

debugPrint "Unlink existing zsh and gitconfig files"
rm -rf "$HOME/.zshrc.pre-oh-my-zsh*" \
    "$HOME/.zcompdump*"

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
checkApp "docker" && ubuntu_install "docker"

debugPrint "Install docker-compose"
checkApp "docker-compose" && ubuntu_install "docker-compose"

debugPrint "Install pyenv"
checkApp "pyenv" && ubuntu_install "pyenv"

debugPrint "Install terraform"
checkApp "terraform" && ubuntu_install "terraform"

debugPrint "Install kubectl"
checkApp "kubectl" && ubuntu_install "kubectl"

debugPrint "Install helm"
checkApp "helm" && ubuntu_install "helm"

debugPrint "Install ansible"
checkApp "ansible" && ubuntu_install "ansible"

debugPrint "Install aws"
checkApp "aws" && ubuntu_install "aws"

debugPrint "Install sam"
checkApp "sam" && ubuntu_install "sam"

debugPrint "Install ebcli"
checkApp "eb" && ubuntu_install "ebcli"

debugPrint "Install gcloud"
checkApp "gcloud" && ubuntu_install "gcloud-cli"

debugPrint "Install cloud sql proxy"
checkApp "cloud-sql-proxy" && ubuntu_install "cloud-sql-proxy"

# install gvm
# install nginx

debugPrint "Install nvm"
checkApp "nvm" && ubuntu_install "nvm"

# install rbenv
# install mysql
# install postgres
# install redis
# install mongodb
# install vagrant
# install virtualbox

debugPrint "Install datagrip"
checkApp "datagrip" && ubuntu_install "datagrip"s

debugPrint "Install android-studio"
checkDir "/snap/android-studio" && ubuntu_install "android-studio"

debugPrint "Install minikube"
checkApp "minikube" && ubuntu_install "minikube"

debugPrint "Install brew"
checkApp "brew" && ubuntu_install "brew"

debugPrint "Install fvm"
checkApp "fvm" && ubuntu_install "fvm"

debugPrint "Install vscode"
checkApp "code" && ubuntu_install "vscode"

debugPrint "Install chrome"
checkApp "google-chrome" && ubuntu_install "chrome"

debugPrint "Docker post-installation"
sudo usermod -aG docker $USER
newgrp docker

debugPrint "Change default shell to zsh"
chsh -s $(which zsh)