FROM php:fpm-alpine3.13

LABEL maintainer="Packie <biyongyao@gmail.com>"

ENV PHP_COMPOSER_URL https://getcomposer.org/composer-stable.phar

RUN apk update \
    && apk --no-cache add \
    git \
    mysql-client \
    curl \
    wget \
    unzip \
    libzip-dev \
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
    && curl $PHP_COMPOSER_URL -o /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && /usr/local/bin/composer self-update \
    && rm -rf /tmp/*