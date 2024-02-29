export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias sync='git add --a && git commit -m "update" && git push'

alias ansible-playbook='docker run -it --rm manhpv151090/ansible'

alias terraform='docker run -it --rm hashicorp/terraform'

alias aws='docker run --rm -it -v ~/.aws:/root/.aws public.ecr.aws/aws-cli/aws-cli'

alias eb='docker run --rm -it -v ~/.aws:/root/.aws -w /workspace -v "$(pwd):/workspace" manhpv151090/ebcli'

alias sam='docker run --rm -it -v ~/.aws:/root/.aws -w /workspace -v "$(pwd):/workspace" manhpv151090/sam'

alias docker-all='docker ps -a;docker images;docker volume ls;docker network ls'

alias docker-remove-all='docker stop $(docker ps -a -q);docker container prune -f;docker image prune -f -a;docker volume prune -a -f;docker network prune -f'