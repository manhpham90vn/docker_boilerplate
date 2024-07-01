#!/bin/bash

source scripts/utils.sh

set -e

# Update package repositories
sudo apt update

# Tools
sudo apt install -y git zsh vim curl wget htop net-tools tree

# Install MySQL
checkCommand "mysql" || source scripts/mysql.sh

# Install Postgres
checkCommand "psql" || source scripts/postgresql.sh

# Install redis
checkCommand "redis-server" || source scripts/redis.sh

# Install elasticsearch
checkDirectory "/usr/share/elasticsearch/bin" || source scripts/elasticsearch.sh