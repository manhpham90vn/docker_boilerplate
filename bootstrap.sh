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

install "zsh"
install "config"