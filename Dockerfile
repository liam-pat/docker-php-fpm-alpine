FROM php:latest-fpm-alpine

LABEL maintainer="Packie Pat <biyongyao@gmail.com>"

RUN apk update \
    && apk add --no-cache git mysql-client curl libmcrypt libmcrypt-dev openssh-client icu-dev \
        libxml2-dev freetype-dev libpng-dev libjpeg-turbo-dev g++ make autoconf \
    && docker-php-source extract \
    && pecl install xdebug redis \
    && docker-php-ext-enable xdebug redis \
    && docker-php-source delete \
    && docker-php-ext-install pdo_mysql \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && rm -rf /tmp/*