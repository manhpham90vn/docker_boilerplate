# My dotfiles

## bootstrap use docker

- wordpress apache

```shell
docker-compose up apache mysql phpmyadmin redis redis-commander
```

1. MySQL 8.4.0: root/toor | admin/admin
2. phpMyAdmin: <http://localhost>
3. PostgreSQL 16.3: postgres/postgres | admin/admin
4. pgAdmin: <http://localhost:81> <admin@admin.com>/admin
5. Redis 7.2.5
6. redis-commander: <http://localhost:8081>
7. elasticsearch 6.0.1
8. kibana <http://localhost:5601>

- remove all docker

```shell
./remove-docker.sh
```

## Common Command

- run process inject .env file

```shell
dotenvx run -- node index.js
```

- show folder structure ignore node_modules and git

```shell
tree -I 'node_modules|.git'
```

- find process by name

```shell
ps aux | grep mysql
```

- find process by port

```shell
sudo netstat -nlp | grep :9200
```

- find file by name

```shell
sudo find /etc -type f -name "*.yml"
```

- fix arm64 build on docker linux

```bash
docker run --privileged --rm tonistiigi/binfmt --install all
```
