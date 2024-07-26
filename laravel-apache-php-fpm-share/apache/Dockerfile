FROM php:8.3.9-apache-bookworm

RUN apt update && apt install -y autoconf unzip libzip-dev

RUN docker-php-ext-install mysqli pdo_mysql zip

RUN pecl install redis

RUN docker-php-ext-enable redis

RUN a2enmod rewrite

COPY laravel-apache-php-fpm-share/apache/000-default.conf /etc/apache2/sites-available/000-default.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www/html

CMD ["apache2-foreground"]