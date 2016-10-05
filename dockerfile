#
# Dockerfile for revive
#

FROM alpine
MAINTAINER kev <xbian99@gmail.com>

WORKDIR /var/www/html

RUN apk add -U gzip \
               nginx \
               php-curl \
               php-fpm \
               php-gd \
               php-json \
               php-mysql \
               php-opcache \
               php-openssl \
               php-pgsql \
               php-phar \
               php-xml \
               php-zlib \
               tar \
    && wget -O- http://download.revive-adserver.com/revive-adserver-4.0.0.tar.gz | tar xz --strip 1 \
    && chown -R nobody:nobody . \
    && rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD php-fpm && nginx -g 'daemon off;'
