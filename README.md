# PHP-FPM-ALPINE

> For PHP developer for developing

## Getting images

```bash
# select git branch
bash > git checkout {{ BRANCH-NAME }}
# build image
bash > docker build -t {{ DOCKER-IMAGE-NAME }} .
bash > docker run --rm {{ DOCKER-IMAGE-NAME }} php -v
```

## Running as server

```bash
bash > docker run --rm \
--name phpfpm \
-v ./web/index.php:/var/www/html/index.php \
-p 10010:8000 {{ DOCKER-IMAGE-NAME }} \
php -S="0.0.0.0:8000" -t="/var/www/html"
```

## docker compose 
```bash
bash > docker-compose up
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

