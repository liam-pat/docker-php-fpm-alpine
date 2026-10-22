ARG PHP_VERSION=8.4

FROM php:${PHP_VERSION}-fpm-alpine AS base

FROM base AS build

LABEL maintainer="Packie <biyongyao@gmail.com>"

RUN apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    git wget unzip bash curl openssh-client \
    libpq-dev libzip-dev libjpeg-turbo-dev libpng-dev libwebp-dev freetype-dev 

RUN --mount=type=bind,from=ghcr.io/php/pie:bin,source=/pie,target=/usr/local/bin/pie \
    pie install --no-cache phpredis/phpredis:6.3.0 \
    && docker-php-ext-configure pgsql --with-pgsql \
    && docker-php-ext-configure gd --with-webp --with-jpeg --with-freetype \
    && docker-php-ext-install -j"$(nproc)" \
       pdo_mysql pdo_pgsql pgsql zip bcmath gd pcntl ftp calendar \
    && if [ "$(php -r 'echo PHP_VERSION_ID;')" -lt 80500 ]; then \
           docker-php-ext-install -j"$(nproc)" opcache; \
       fi

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

FROM base AS runtime

LABEL maintainer="Packie <biyongyao@gmail.com>"

RUN apk add --no-cache \
    libpq libzip libjpeg-turbo libpng libwebp freetype \
    bash openssh-client curl unzip wget git

COPY --from=build /usr/local/lib/php/extensions /usr/local/lib/php/extensions
COPY --from=build /usr/local/etc/php/conf.d /usr/local/etc/php/conf.d
COPY --from=build /usr/local/bin/composer /usr/local/bin/composer

EXPOSE 9000
CMD ["php-fpm"]