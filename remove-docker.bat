@echo off
echo Stopping all running containers...
for /f "tokens=*" %%i in ('docker ps -aq') do docker stop %%i

echo Pruning all stopped containers...
docker container prune -f

echo Pruning all unused images...
docker image prune -f -a

echo Pruning all unused volumes...
docker volume prune -f -a

echo Pruning all unused networks...
docker network prune -f

echo Pruning all unused system objects...
docker system prune

echo Cleanup completed.
pause