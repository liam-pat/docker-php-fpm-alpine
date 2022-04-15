FROM php:8.1-fpm-alpine

LABEL maintainer="Packie <biyongyao@gmail.com>"

#ENV
ENV PHP_COMPOSER_URL https://getcomposer.org/composer-stable.phar

RUN apk update \
    && apk add --no-cache git wget unzip curl libpq-dev libzip-dev libmcrypt \
    libjpeg-turbo-dev libpng-dev libwebp-dev freetype-dev bash\
    g++ make autoconf \
    && pecl install redis xdebug \
    && docker-php-ext-enable xdebug redis \
    && echo "xdebug.mode = debug" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && echo "xdebug.client_host = host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-configure gd --with-webp --with-jpeg --with-freetype \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql pgsql zip opcache bcmath gd \
    && curl $PHP_COMPOSER_URL -o /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer \
    && /usr/local/bin/composer self-update \
    && rm -rf /tmp/*

CMD crond && php-fpm

EXPOSE 9000