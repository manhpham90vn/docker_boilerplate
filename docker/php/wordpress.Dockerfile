FROM php:8.3.9-fpm-alpine3.20

RUN apk add --no-cache build-base autoconf

RUN pecl install redis

RUN docker-php-ext-install mysqli pdo_mysql

RUN docker-php-ext-enable redis

CMD ["php-fpm"]