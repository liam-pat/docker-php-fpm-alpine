FROM php:8.4-fpm-alpine AS build

LABEL maintainer="Packie <biyongyao@gmail.com>"

RUN apk add --no-cache --virtual .build-deps \
    git wget unzip bash curl openssh \
    libpq-dev libzip-dev libjpeg-turbo-dev libpng-dev libwebp-dev freetype-dev \
    linux-headers libmcrypt g++ make autoconf

RUN pecl install redis \
    && docker-php-ext-enable redis \
    && docker-php-ext-configure pgsql -with-pgsql=/usr/local/pgsql \
    && docker-php-ext-configure gd --with-webp --with-jpeg --with-freetype \
    && docker-php-ext-install pdo pdo_mysql pdo_pgsql pgsql zip opcache bcmath gd pcntl ftp calendar

ENV PHP_COMPOSER_URL="https://getcomposer.org/composer-stable.phar"
RUN curl -sS $PHP_COMPOSER_URL -o /usr/local/bin/composer \
    && chmod a+x /usr/local/bin/composer

FROM php:8.4-fpm-alpine

LABEL maintainer="Packie <biyongyao@gmail.com>"

RUN apk add --no-cache \
    libpq libzip libjpeg-turbo libpng libwebp freetype bash openssh curl unzip wget git

COPY --from=build /usr/local/lib/php/extensions /usr/local/lib/php/extensions
COPY --from=build /usr/local/etc/php/conf.d /usr/local/etc/php/conf.d
COPY --from=build /usr/local/bin/php /usr/local/bin/php
COPY --from=build /usr/local/bin/composer /usr/local/bin/composer

EXPOSE 9000
CMD ["php-fpm"]