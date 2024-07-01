#!/bin/bash

set -e

# MySQL configuration
MYSQL_ROOT_PASSWORD=toor
MYSQL_USER=admin
MYSQL_PASSWORD=admin
MYSQL_DB_NAME=app

# PostgreSQL configuration
POSTGRES_ADMIN=postgres
POSTGRES_ADMIN_PASSWORD=postgres
POSTGRES_USER=admin
POSTGRES_USER_PASSWORD=admin
POSTGRES_DB_NAME=app

# Update package repositories
sudo apt update

# Tools
sudo apt install -y git zsh vim curl wget htop net-tools tree

# Install MySQL
sudo apt install -y mysql-server
cat > mysql.sql << EOF
ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$MYSQL_ROOT_PASSWORD';
DROP DATABASE IF EXISTS $MYSQL_DB_NAME;
CREATE DATABASE $MYSQL_DB_NAME;
DROP USER IF EXISTS '$MYSQL_USER'@'localhost';
CREATE USER '$MYSQL_USER'@'localhost' IDENTIFIED WITH caching_sha2_password BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'localhost';
FLUSH PRIVILEGES;
EOF
sudo mysql < mysql.sql
rm -rf mysql.sql

# Install Postgres
sudo apt install -y postgresql postgresql-contrib
cat > postgresql.sql << EOF
ALTER USER $POSTGRES_ADMIN WITH PASSWORD '$POSTGRES_ADMIN_PASSWORD';
DROP ROLE IF EXISTS $POSTGRES_USER;
CREATE ROLE $POSTGRES_USER WITH LOGIN PASSWORD '$POSTGRES_USER_PASSWORD';
ALTER ROLE $POSTGRES_USER WITH CREATEDB;
DROP DATABASE IF EXISTS $POSTGRES_DB_NAME;
CREATE DATABASE $POSTGRES_DB_NAME;
GRANT ALL PRIVILEGES ON DATABASE $POSTGRES_DB_NAME to $POSTGRES_USER;
EOF
sudo -u postgres psql < postgresql.sql
rm -rf postgresql.sql

# Install redis
sudo apt install -y lsb-release curl gpg
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list
sudo apt-get update
sudo apt-get install -y redis

# Install elasticsearch
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elasticsearch-keyring.gpg
sudo apt-get install -y apt-transport-https
echo "deb [signed-by=/usr/share/keyrings/elasticsearch-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee /etc/apt/sources.list.d/elastic-8.x.list
sudo apt-get update && sudo apt-get install -y elasticsearch