FROM php:8.3.9-fpm-alpine3.20

RUN apk add --no-cache \
    build-base \
    autoconf \
    nginx \
    $PHPIZE_DEPS \
    icu-dev \
    freetype-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libzip-dev \
    oniguruma-dev \
    libxml2-dev

COPY laravel-nginx-php-fpm-share/nginx/default.conf /etc/nginx/http.d/default.conf

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
        bcmath \
        gd \
        intl \
        opcache \
        pdo \
        pdo_mysql \
        mbstring \
        xml \
        ctype \
        zip \
        pcntl

RUN docker-php-source delete

RUN pecl install redis && docker-php-ext-enable redis

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /var/www/html

CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]