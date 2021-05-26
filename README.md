# PHP-FPM-ALPINE

## Support Version

* 8.0

## Getting images

```bash
# It will pull the version 8.0 php version
docker pull biyongyao/php-fpm-prod:8.0
```

## Running PHP Command

```bash
docker run --rm biyongyao/php-fpm-prod:8.0 php -v
```

## Running as server

```bash
docker run --rm --name phpfpm -v /Users/biyongyao/www/php-fpm-alpine/web/index.php:/var/www/html/index.php -p 10010:8000 biyongyao/php-fpm-prod:8.0 php -S="0.0.0.0:8000" -t="/var/www/html"
```

## docker compose Run Web-Serve

```bash
docker-composer up

## Browse in browser : localhost:10010
```

## PHP Modules

```config
[PHP Modules]
Core
ctype
curl
date
dom
fileinfo
filter
ftp
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
pdo_sqlite
Phar
posix
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
zlib

[Zend Modules]
```

