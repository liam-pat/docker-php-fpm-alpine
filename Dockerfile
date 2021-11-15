FROM php:8.0-fpm-alpine

LABEL maintainer="Packie <biyongyao@gmail.com>"

#ENV
ENV PHP_COMPOSER_URL https://getcomposer.org/composer-stable.phar

RUN apk update \
    && apk add --no-cache git bash mysql-client curl wget unzip libzip-dev libmcrypt libmcrypt-dev openssh-client libxml2-dev icu-dev freetype-dev libpng-dev libjpeg-turbo-dev \
    gcc g++ make automake autoconf \
    && docker-php-source extract \
    && pecl install redis xdebug \
    && docker-php-ext-enable xdebug redis \
    && echo "xdebug.mode = debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host = host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && docker-php-source delete \
    && docker-php-ext-install pdo_mysql zip\
    && curl $PHP_COMPOSER_URL -o /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && /usr/local/bin/composer self-update \