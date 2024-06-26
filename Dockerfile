FROM php:8.2-fpm-alpine

LABEL maintainer="Packie <biyongyao@gmail.com>"

#ENV
ENV PHP_COMPOSER_URL https://getcomposer.org/composer-stable.phar

RUN apk update \
    && apk add --no-cache git wget unzip curl libpq-dev libzip-dev libmcrypt linux-headers openssh\
    libjpeg-turbo-dev libpng-dev libwebp-dev freetype-dev bash\
    g++ make autoconf \
    && pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-configure gd --with-webp --with-jpeg --with-freetype \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql pgsql zip opcache bcmath gd pcntl ftp calendar\
    && curl $PHP_COMPOSER_URL -o /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && /usr/local/bin/composer self-update \
    && rm -rf /tmp/*

CMD php-fpm

EXPOSE 9000