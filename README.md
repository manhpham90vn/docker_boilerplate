# Docker Boilerplate

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
