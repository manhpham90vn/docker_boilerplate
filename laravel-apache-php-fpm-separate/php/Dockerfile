FROM php:8.3.9-fpm-alpine3.20

RUN apk add --no-cache build-base autoconf libzip-dev

RUN docker-php-ext-install mysqli pdo_mysql zip

RUN pecl install redis

RUN docker-php-ext-enable redis

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /var/www/html

CMD ["php-fpm"]