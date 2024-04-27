FROM ubuntu:22.04

ARG USER=ubuntu
ARG UID=1001
ARG PYTHON_VERSION=3.9.18

# setup environment
RUN apt update && apt install -y --no-install-recommends git curl wget unzip sudo ca-certificates
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
    git clone --depth=1 https://github.com/pyenv/pyenv.git "$HOME/.pyenv"
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