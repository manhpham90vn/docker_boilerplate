FROM php:8.3.9-apache-bookworm

RUN apt update && apt install -y unzip libzip-dev

RUN a2enmod rewrite

RUN docker-php-ext-install mysqli pdo_mysql zip

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["apache2-foreground"]