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