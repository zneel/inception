FROM alpine:3.17

LABEL version="1.0"
LABEL description="nginx"

ENV TERM xterm-256color

# nginx user
RUN addgroup -S www-data && adduser -S www-data -G www-data || true;
RUN adduser -S -D -G www-data www-data || true;


RUN apk update && apk upgrade
RUN apk add nginx vim curl openssl

#SSL
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt  -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ebouvier.42.fr/UID=ebouvier"

#NGINX CONF
RUN mkdir -p /var/run/nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www
RUN chown -R www-data:www-data /var/www
RUN chmod 755 /var/www

# REDIRECT LOGS
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]