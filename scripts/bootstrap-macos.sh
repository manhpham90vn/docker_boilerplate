#!/bin/bash

source $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/update-submodules.sh
source $(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/symlink.sh
brew bundle --file=Brewfile