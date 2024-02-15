# Variable
ROOT_PASSWORD=toor
DB_USER=admin
DB_PASSWORD=admin
DB_NAME=wordpress
REMOTE_IP=1.2.3.4
DOMAIN=domain.com
ROOT_HTML=/var/www/html

# Update
sudo apt update && sudo apt upgrade -y

# Install tool
sudo apt install -y git wget

# Install Nginx
sudo apt install -y nginx
sudo systemctl enable nginx

# Config Nginx
sudo rm -rf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
cat <<EOF | sudo tee /etc/nginx/sites-available/default
server {
    listen 80;
    server_name $DOMAIN www.$DOMAIN;
    index index.php index.html index.htm;
    root $ROOT_HTML;
    error_log  /var/log/nginx/error.log;
    access_log /var/log/nginx/access.log;

    location / {
        try_files \$uri \$uri/ /index.php?q=\$uri\$args;
    }

    location ~ \.php$ {
        try_files \$uri \$uri/ /index.php?q=\$uri\$args;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        fastcgi_param PATH_INFO \$fastcgi_path_info;
    }
}
EOF
sudo ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
sudo systemctl restart nginx

# Install MariaDB
sudo apt install mariadb-server mariadb-client -y
sudo systemctl enable mariadb

# Create database and mysql user
cat > mysql_secure_installation.sql << EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
FLUSH PRIVILEGES;
EOF

sudo mysql < mysql_secure_installation.sql 

cat > installation.sql << EOF
CREATE DATABASE $DB_NAME;
CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';
CREATE USER '$DB_USER'@'$REMOTE_IP' IDENTIFIED BY '$DB_PASSWORD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO 'admin'@'localhost';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO 'admin'@'$REMOTE_IP';
FLUSH PRIVILEGES;
EOF

sudo mysql -uroot -p$ROOT_PASSWORD  < installation.sql
sudo rm -rf mysql_secure_installation.sql installation.sql

# Update MariaDB config allow remote login
sudo sed -i 's/bind-address/#bind-address/' /etc/mysql/mariadb.conf.d/50-server.cnf
sudo sh -c "echo 'bind-address = 0.0.0.0' >> /etc/mysql/mariadb.conf.d/50-server.cnf"
sudo systemctl restart mariadb

# Install Redis
sudo apt install -y redis-server
sudo systemctl enable redis-server

# Config Redis
sudo sed -i 's/supervised no/supervised systemd/' /etc/redis/redis.conf
sudo systemctl restart redis

# Install php
sudo apt install -y php8.1-fpm php8.1-cli php8.1-common php8.1-mysql php8.1-zip php8.1-gd php8.1-mbstring php8.1-curl php8.1-xml php8.1-bcmath php8.1-redis
sudo systemctl enable php8.1-fpm

# Check info
sudo sh -c "echo '<?php phpinfo();' >> $ROOT_HTML/info.php"