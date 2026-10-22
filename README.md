# PHP-FPM-ALPINE

> For developing.....

## Getting images

```bash
docker pull --platform linux/arm64 biyongyao/php-fpm-alpine-dev:8.4
docker pull --platform linux/arm64 biyongyao/php-fpm-alpine-prod:8.4
```

## Inspect PHP Information

### 1) Docker Build

- PROD version
```bash
docker buildx build --pull \
  --build-arg PHP_VERSION=8.4 \
  --platform linux/amd64,linux/arm64 \
  --progress=plain \
  -t biyongyao/php-fpm-alpine-prod:8.4 \
  --push .
```

- DEV version
```bash
docker buildx build --pull \
  --build-arg PHP_VERSION=8.5 \
  --platform linux/amd64,linux/arm64 \
  --progress=plain \
  -f Dockerfile.dev.yml \
  -t biyongyao/php-fpm-alpine-dev:8.5 \
  --push .
```

### 2) Verification

```bash
# inspect the verion & modules
docker run --rm biyongyao/php-fpm-alpine-prod:8.4 php -v
docker run --rm biyongyao/php-fpm-alpine-prod:8.4 php-fpm -v
docker run --rm biyongyao/php-fpm-alpine-prod:8.4 php -m

# http:127.0.0.1:8000 , check the php info
docker run --rm \
  -v "$(pwd)/web/index.php:/website/index.php:ro" \
  -p 8000:8000 \
  biyongyao/php-fpm-alpine-prod:8.4 \
  php -S 0.0.0.0:8000 -t /website
```

## PHP Modules

```config
[PHP Modules]
bcmath
calendar
cgi-fcgi
Core
ctype
curl
date
dom
fileinfo
filter
ftp
gd
hash
iconv
json
libxml
mbstring
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_pgsql
pdo_sqlite
pgsql
Phar
posix
random
readline
redis
Reflection
session
SimpleXML
sodium
SPL
sqlite3
standard
tokenizer
xml
xmlreader
xmlwriter
Zend OPcache
zip
zlib

[Zend Modules]
Zend OPcache
```