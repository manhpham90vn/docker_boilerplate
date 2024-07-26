FROM php:8.3.9-apache-bookworm

RUN docker-php-ext-install mysqli pdo_mysql

RUN pecl install redis

RUN docker-php-ext-enable redis

RUN a2enmod rewrite

COPY 000-default.conf /etc/apache2/sites-available/000-default.conf

CMD ["apache2-foreground"]