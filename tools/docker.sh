# list all container
docker ps -a

# copy file to container
docker cp foo.txt container_id:/tmp/foo.txt

# run bash in container width user postgres
docker exec -it --user postgres container_id bash

# build image
docker build .

# list images
docker images

# run image
docker run -p 80:80 -d --rm --name container_name image_id

# stop container
docker stop container_id

# start container with interactive
docker start -a -i container_id

# stop and remove all container
docker stop $(docker ps -aq)
docker remove $(docker ps -aq)

# remove all images
docker rmi -f $(docker images -aq)

# remove networks
docker network rm $(docker network ls)

# remove volumns
docker volume rm $(docker volume ls)