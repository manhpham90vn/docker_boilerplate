# MySQL configuration
MYSQL_ROOT_PASSWORD=toor
MYSQL_USER=admin
MYSQL_PASSWORD=admin
MYSQL_DB_NAME=app

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