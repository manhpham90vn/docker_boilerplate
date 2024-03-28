# https://docs.docker.com/compose/install/standalone/
sudo rm -rf /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo curl -SL https://github.com/docker/compose/releases/download/v2.24.7/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose