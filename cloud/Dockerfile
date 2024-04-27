FROM ubuntu:22.04

ARG USER=ubuntu
ARG UID=1001
ARG PYTHON_VERSION=3.9.18
ARG NODE_VERSION=20.12.2

# setup environment
RUN apt update && apt install -y --no-install-recommends git curl wget unzip sudo ca-certificates gpg lsb-release
RUN useradd -rm -d /home/${USER} -s /bin/bash -g root -G sudo -u ${UID} ${USER} && \
    echo "${USER} ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/${USER} && \
    chmod 0440 /etc/sudoers.d/${USER}
ENV HOME=/home/${USER}
WORKDIR ${HOME}
USER ${USER}

# install pyenv
ARG DEBIAN_FRONTEND="noninteractive"
RUN sudo ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime && sudo apt update && \ 
    sudo apt install -y --no-install-recommends build-essential libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev curl \
    libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev && \
    git clone --depth=1 "https://github.com/pyenv/pyenv.git" "$HOME/.pyenv"
ENV PYENV_ROOT="${HOME}/.pyenv"
ENV PATH="${PYENV_ROOT}/shims:${PYENV_ROOT}/bin:${PATH}"
RUN pyenv install ${PYTHON_VERSION} && \
    pyenv global ${PYTHON_VERSION} && \
    pyenv rehash

# install aws-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip ./awscliv2.zip && \
    sudo ./aws/install && \
    rm -rf ./awscliv2.zip ./aws

# install sam-cli
RUN wget "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" -O "sam.zip" && \
    unzip ./sam.zip -d sam && \
    sudo ./sam/install && \
    rm -rf ./sam.zip ./sam

# install eb-cli
RUN pip install awsebcli --upgrade --user
ENV PATH="${HOME}/.local/bin:${PATH}"

# install terraform
RUN wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
RUN echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
RUN sudo apt update && sudo apt -y install terraform

# install terragrunt
RUN wget "https://github.com/gruntwork-io/terragrunt/releases/download/v0.57.12/terragrunt_linux_386" && \
    sudo mv terragrunt_linux_386 /usr/local/bin/terragrunt && \
    sudo chmod +x /usr/local/bin/terragrunt

# install nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
ENV NVM_DIR="${HOME}/.nvm"
RUN [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" && \
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" && \
    nvm install ${NODE_VERSION} && \
    nvm use ${NODE_VERSION} && \
    nvm alias default ${NODE_VERSION}
ENV NODE_PATH=${NVM_DIR}/v${NODE_VERSION}/lib/node_modules
ENV PATH=${NVM_DIR}/versions/node/v${NODE_VERSION}/bin:${PATH}

# install serverless
RUN npm install -g serverless