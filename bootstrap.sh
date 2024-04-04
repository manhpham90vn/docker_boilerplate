#!/bin/bash

source $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/scripts/common.sh

debugPrint "Bootstraping MacOS"

debugPrint "Install Homebrew"
checkApp "brew" || install "brew"

debugPrint "Install xcodes"
checkApp "xcodes" || install "xcodes"

debugPrint "Install Android Studio"
checkDir "/Applications/Android Studio.app" || install "android-studio"

install "zsh"
install "config"