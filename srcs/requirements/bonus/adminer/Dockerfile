FROM alpine:3.17

LABEL version="1.0"
LABEL description="adminer"

ENV TERM xterm-256color

RUN apk update && apk upgrade
RUN apk add curl \ 
  php \
  php-fpm \
  php-mysqli \
  php-phar \
  php-iconv \
  php-gd \
  php-json \
  php-pdo \
  php-pdo_mysql \
  php-xml \
  php-simplexml \
  php-tokenizer \
  php-dom \
  php-session \
  zlib \
  mariadb-client

RUN mkdir -p /var/www/adminer
RUN sed -i 's/listen = 127.0.0.1:9000/listen = adminer:9000/' /etc/php81/php-fpm.d/www.conf
COPY ./tools/setup.sh /
WORKDIR /var/www/adminer
CMD [ "sh", "/setup.sh" ]
