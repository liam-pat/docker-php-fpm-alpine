FROM php:8.0-fpm-alpine

LABEL maintainer="Packie <biyongyao@gmail.com>"

RUN apk update \
    && apk --no-cache add \
    git \
    mysql-client \
    curl \
    libmcrypt \
    openssh-client \
    autoconf \
    automake \
    make \
    gcc \
    g++ \
    bash \
    icu-dev \
    libzip-dev \
    && docker-php-source extract \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-source delete \
    && docker-php-ext-install pdo_mysql \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && rm -rf /tmp/*