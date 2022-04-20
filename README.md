## Support Version

* 7.3

## Getting images

```bash
# It will pull the latest php version
docker push biyongyao/php-fpm-dev
```

## Running PHP Command

```bash
docker run --rm biyongyao/php-fpm-dev:7.3 php -v
```

## Running as server

```bash
docker run --rm --name phpfpm -v /Users/biyongyao/www/php-fpm-alpine/web/index.php:/var/www/html/index.php -p 10010:8000 biyongyao/php-fpm-dev php -S="0.0.0.0:8000" -t="/var/www/html"
```

## docker compose Run Web-Serve

```bash
docker-composer up
```
