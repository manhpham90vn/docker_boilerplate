#!/bin/bash

# install
sudo apt install -y git \
    zsh \
    vim \
    curl

source $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/update-submodules.sh
source $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/symlink.sh