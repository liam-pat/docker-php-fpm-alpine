# PHP-FPM-ALPINE

> For develop environment

## Support Version

* 7.3.x
* 8.2.x

## Getting images

```bash
# build image
bash > docker build -t biyongyao/php-fpm-alpine-dev:8.2 .
# pull from dockerhub
bash > docker pull biyongyao/php-fpm-prod:8.2
# php version
bash > docker run --rm biyongyao/php-fpm-prod:8.0 php -v
```

## Running as server

```bash
bash > docker run --rm \
--name phpfpm \
-v ./web/index.php:/var/www/html/index.php \
-p 10010:8000 biyongyao/php-fpm-prod:8.0 \
php -S="0.0.0.0:8000" -t="/var/www/html"
```

## docker compose Run Web-Serve
```bash
## Browse in browser : localhost:10010
bash > docker-composer up
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

