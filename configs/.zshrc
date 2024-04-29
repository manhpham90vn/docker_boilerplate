# zshrc for macos
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# alias
alias sync="git add --all && git commit -m 'sync' && git push"
alias check_size="du -sh * | sort -h"
alias docker-stop="docker stop $(docker ps -a -q)"

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# docker
export DOCKER_HOST=unix://$HOME/.docker/run/docker.sock

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/manh/.dart-cli-completion/zsh-config.zsh ]] && . /Users/manh/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

export PATH="/usr/local/opt/ruby@3.0/bin:$PATH"
export PATH="/usr/local/opt/node@16/bin:$PATH"
export PATH="/usr/local/opt/go@1.21/bin:$PATH"
