DOMAIN=domain.com
EMAIL=mail@gmail.com

# Install certbot
sudo dnf install -y augeas-libs
sudo python3 -m venv /opt/certbot/
sudo /opt/certbot/bin/pip install --upgrade pip
sudo /opt/certbot/bin/pip install certbot
sudo ln -s /opt/certbot/bin/certbot /usr/bin/certbot

# Create pem file and copy
sudo certbot certonly -a manual --preferred-challenges dns --email $EMAIL --rsa-key-size 4096 -d $DOMAIN -d *.$DOMAIN

# Output
sudo cat /etc/letsencrypt/live/$DOMAIN/privkey.pem
sudo cat /etc/letsencrypt/live/$DOMAIN/fullchain.pem