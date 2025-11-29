FROM php:alpine
LABEL Maintainer="BohwaZ <https://bohwaz.net/>" \
      Description="oPodSync"

# Setup document root
RUN mkdir -p /var/www/server/data

# Add application
WORKDIR /var/www/
COPY server /var/www/server/

EXPOSE 8080

VOLUME ["/var/www/server/data"]

ENV PHP_CLI_SERVER_WORKERS=2
CMD ["php", "-S", "0.0.0.0:8080", "-t", "server", "server/index.php"]
