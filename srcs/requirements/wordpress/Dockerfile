FROM alpine:3.17

LABEL version="1.0"
LABEL description="wordpress"

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
  zlib \
  mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN php wp-cli.phar --info
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /run/php /var/www/wordpress

RUN sed -i 's/listen = 127.0.0.1:9000/listen = wordpress:9000/' /etc/php81/php-fpm.d/www.conf
COPY ./tools/setup.sh /

WORKDIR /var/www/wordpress
CMD [ "sh", "/setup.sh" ]