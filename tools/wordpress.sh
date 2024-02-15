DB_USER=admin
DB_PASSWORD=admin
DB_NAME=wordpress
DOMAIN=domain.com
DOMAIN_TITLE="My Website"
DOMAIN_USERNAME=admin
DOMAIN_PASSWORD=admin
DOMAIN_EMAIL=mail@gmail.com
ROOT_HTML=/usr/share/nginx/html #/var/www/html
ROOT_USER=apache #www-data

# Install wordpress cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar 
sudo mv wp-cli.phar /usr/local/bin/wp

# Install wordpress
cd $ROOT_HTML
sudo rm -rf *
sudo chown -R $USER:$USER $ROOT_HTML
wp core download
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD
wp core install --url=$DOMAIN --title="$DOMAIN_TITLE" --admin_user=$DOMAIN_USERNAME --admin_password=$DOMAIN_PASSWORD --admin_email=$DOMAIN_EMAIL

# chmod & chown
sudo chown -R $ROOT_USER:$ROOT_USER $ROOT_HTML
sudo find $ROOT_HTML -type d -exec chmod 755 {} \;
sudo find $ROOT_HTML -type f -exec chmod 644 {} \;