FROM php:7.4-fpm-alpine

ADD ./laravel-docker/php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN apk --no-cache --update --repository http://dl-cdn.alpinelinux.org/alpine/v3.12/main/ add gmp-dev

RUN apk update \
    && apk add --no-cache git mysql-client curl postgresql-dev openssh-client icu libpng libjpeg-turbo libmcrypt libmcrypt-dev libsodium pwgen\
    && apk add --no-cache --virtual build-dependencies icu-dev \
    libxml2-dev freetype-dev libpng-dev libjpeg-turbo-dev g++ make autoconf \
    && pecl install xdebug redis \
    && docker-php-ext-enable xdebug redis \
    && docker-php-ext-install pdo_mysql soap intl pdo pdo_pgsql opcache gmp \
    && apk del build-dependencies \
    && apk del libmcrypt-dev \
    && rm -rf /tmp/*

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN mkdir -p /var/www/html

RUN chown laravel:laravel /var/www/html

WORKDIR /var/www/html
