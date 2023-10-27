FROM alpine:3.17

LABEL version="1.0"
LABEL description="wordpress"

ENV TERM xterm-256color

RUN apk update && apk upgrade
RUN apk add curl php php-fpm php-mysqli php-phar php-iconv mariadb-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN php wp-cli.phar --info
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN mkdir -p /var/www/wordpress
RUN mkdir -p /run/php
RUN sed -i 's/listen = 127.0.0.1:9000/listen = wordpress:9000/' /etc/php81/php-fpm.d/www.conf

WORKDIR /var/www/wordpress

EXPOSE 9000

COPY ./tools/wp.sh /var/www/wordpress/
CMD [ "sh", "/var/www/wordpress/wp.sh" ]