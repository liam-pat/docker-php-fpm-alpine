# PHP-FPM-ALPINE

> For developing.....

## Getting images

```bash
# without xdebug
bash > docker pull biyongyao/php-fpm-alpine-prod

# install the xdebug module
bash > docker pull biyongyao/php-fpm-alpine-dev
```

## Inspect PHP Information

### 1) Docker Run 

```bash
bash > docker run --rm --name phpfpm -v ./web/index.php:/var/www/html/index.php -p 10010:8000 {{ DOCKER-IMAGE-NAME }} php -S="0.0.0.0:8000" -t="/var/www/html"
```

### 2) Docker compose

```bash
bash > docker-compose up -d
```

## PHP Modules

```config
[PHP Modules]
bcmath
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
xdebug
xml
xmlreader
xmlwriter
Zend OPcache
zip
zlib

[Zend Modules]
Zend OPcache
Xdebug
```

