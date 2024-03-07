#!/bin/bash

bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Bootstraping Ubuntu"

# install tools
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install tools"

sudo rm -rf /etc/apt/sources.list.d
sudo apt remove -y git \
    zsh \
    vim \
    curl \
    zsh \
    ca-certificates \
    tree
sudo apt install -y git \
    zsh \
    vim \
    curl \
    zsh \
    tree

# unlink existing before install
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Unlink existing zsh"
rm -rf "$HOME/.oh-my-zsh"

# https://ohmyz.sh/#install
# https://github.com/ohmyzsh/ohmyzsh?tab=readme-ov-file#1-clone-the-repository-
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install oh-my-zsh"
rm -rf ~/.oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# https://github.com/marlonrichert/zsh-autocomplete?tab=readme-ov-file#manual-installation
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install zsh-autocomplete"
rm -rf ~/.zsh-autocomplete
git clone --depth 1 https://github.com/marlonrichert/zsh-autocomplete.git ~/.zsh-autocomplete

# unlink existing before install
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Unlink existing .zshrc and .gitconfig"
rm -rf "$HOME/.zshrc" \
    "$HOME/.zshrc.pre-oh-my-zsh*"\
    "$HOME/.gitconfig"

# link
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Link .zshrc and .gitconfig"
ln -s "$(pwd)/.zshrc_ubuntu" "$HOME/.zshrc"
ln -s "$(pwd)/.gitconfig" "$HOME/.gitconfig"

# install docker
# https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install docker"
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
# https://docs.docker.com/compose/install/standalone/
sudo curl -SL https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# install pyenv
# https://github.com/pyenv/pyenv?tab=readme-ov-file#basic-github-checkout
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install pyenv"
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# https://github.com/pyenv/pyenv/wiki#suggested-build-environment
sudo apt update
sudo apt install -y build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# install terraform
# https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install terraform"
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common
wget -O- https://apt.releases.hashicorp.com/gpg | \
gpg --dearmor | \
sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg > /dev/null
gpg --no-default-keyring \
--keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
--fingerprint
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update
sudo apt-get install -y terraform

# install kubectl
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-kubectl-binary-with-curl-on-linux
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install kubectl"
curl -LO https://dl.k8s.io/release/`curl -LS https://dl.k8s.io/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# install helm
# https://helm.sh/docs/intro/install/#from-apt-debianubuntu
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install helm"
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install -y helm

# install ansible
# https://docs.ansible.com/ansible/latest/installation_guide/installation_distros.html#installing-ansible-on-ubuntu
bash $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/info.sh "Install ansible"
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" | sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu jammy main" | sudo tee /etc/apt/sources.list.d/ansible.list
sudo apt update && sudo apt install -y ansible

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

# install minikube
# https://minikube.sigs.k8s.io/docs/start/
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
rm -rf minikube-linux-amd64

# install virtualbox
# install datagrip
# install vscode
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install -y apt-transport-https
sudo apt update
sudo apt install -y code

# install chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp
sudo apt install /tmp/google-chrome-stable_current_amd64.deb

# Docker post-installation
sudo usermod -aG docker $USER
newgrp docker

# change shell to zsh
chsh -s $(which zsh)