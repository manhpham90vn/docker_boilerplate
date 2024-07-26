@echo off

docker exec %1 composer install
docker exec %1 php artisan key:generate
docker exec %1 php artisan config:clear
docker exec %1 php artisan migrate