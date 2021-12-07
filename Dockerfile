FROM php:8.1-fpm-alpine

LABEL maintainer="Packie <biyongyao@gmail.com>"

#ENV
ENV PHP_COMPOSER_URL https://getcomposer.org/composer-stable.phar

RUN apk update \
    && apk add --no-cache git wget unzip curl libpq-dev libzip-dev libmcrypt \
    g++ make autoconf \
    && pecl install redis xdebug \
    && docker-php-ext-enable xdebug redis \
    && echo "xdebug.mode = debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host = host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql pgsql zip \
    && curl $PHP_COMPOSER_URL -o /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && /usr/local/bin/composer self-update \