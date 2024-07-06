docker stop $(docker ps -aq)
docker container prune -f
docker image prune -f -a
docker volume prune -f -a
docker network prune -f
docker system prune