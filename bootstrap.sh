#!/bin/bash

source $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/common.sh

debugPrint "Bootstraping MacOS"

debugPrint "Install Homebrew"
checkApp "brew" || install "brew"

debugPrint "Install xcodes"
checkApp "xcodes" || install "xcodes"

debugPrint "Install Android Studio"
checkDir "/Applications/Android Studio.app" || install "android-studio"

debugPrint "Install Vscode"
checkDir "/Applications/Visual Studio Code.app" || install "vscode"

debugPrint "Install Sourcetree"
checkDir "/Applications/Sourcetree.app" || install "sourcetree"

debugPrint "Install iTerm2"
checkDir "/Applications/iTerm.app" || install "iterm2"

debugPrint "Install Docker"
checkDir "/Applications/Docker.app" || install "docker"

debugPrint "Install Postman"
checkDir "/Applications/Postman.app" || install "postman"

debugPrint "Install DataGrip"
checkDir "/Applications/DataGrip.app" || install "datagrip"

debugPrint "Install Chrome"
checkDir "/Applications/Google Chrome.app" || install "chrome"

debugPrint "Install OpenVPN"
checkDir "/Applications/OpenVPN Connect.app" || install "openvpn"

debugPrint "Install charles"
checkDir "/Applications/Charles.app" || install "charles"

debugPrint "Install rbenv"
checkApp "rbenv" || install "rbenv"

debugPrint "Install nvm"
checkApp "nvm" || install "nvm"

debugPrint "Install g"
checkApp "g" || install "g"

debugPrint "Install pyenv"
checkApp "pyenv" || install "pyenv"

debugPrint "Install awscli"
checkApp "aws" || install "awscli"

debugPrint "Install samcli"
checkApp "sam" || install "samcli"

debugPrint "Install ebcli"
checkApp "eb" || install "ebcli"

debugPrint "Install ansible"
checkApp "ansible" || install "ansible"

install "zsh"
install "config"