# My dotfiles

## bootstrap use docker

- command

```shell
cd docker
docker-compose up
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
cd docker
./remove-docker.sh
```

## bootstrap use command

- command

```shell
./init.sh
```

1. MySQL: root/toor | admin/admin
2. PostgreSQL: postgres/postgres | admin/admin

## Fix

- fix arm64 build on docker linux

```bash
docker run --privileged --rm tonistiigi/binfmt --install all
```
