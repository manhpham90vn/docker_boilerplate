# stop and remove all container
docker stop $(docker ps -aq)
docker remove $(docker ps -aq)

# remove all images
docker rmi -f $(docker images -aq)

# remove networks
docker network rm $(docker network ls)

# remove volumns
docker volume rm $(docker volume ls)