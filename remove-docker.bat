FOR /f "tokens=*" %%i IN ('docker ps -aq') DO docker stop %%i
docker container prune -f
docker image prune -f -a
docker volume prune -f -a
docker network prune -f
docker system prune