FROM ubuntu:22.04

WORKDIR /app

RUN apt update && apt install -y git curl wget unzip

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip ./awscliv2.zip && \
    ./aws/install && \
    rm -rf ./awscliv2.zip ./aws

RUN wget "https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip" -O sam.zip && \
    unzip ./sam.zip -d sam && \
    ./sam/install && \
    rm -rf ./sam.zip ./sam