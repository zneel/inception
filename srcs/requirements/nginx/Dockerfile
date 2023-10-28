FROM alpine:3.17

LABEL version="1.0"
LABEL description="nginx"

ENV TERM xterm-256color

# nginx user
RUN addgroup -g 101 -S nginx;
RUN adduser -S -D -H -u 101 -h /var/cache/nginx -s /sbin/nologin -G nginx -g nginx nginx;


RUN apk update && apk upgrade
RUN apk add --no-cache nginx curl openssl nginx-mod-http-lua

RUN mkdir -p /var/run/nginx /var/www /etc/nginx/ssl

#SSL
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/wordpress.crt  -keyout /etc/nginx/ssl/wordpress.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ebouvier.42.fr/UID=ebouvier"
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/adminer.crt  -keyout /etc/nginx/ssl/adminer.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=adminer.42.fr/UID=adminer"
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/mywebsite.crt  -keyout /etc/nginx/ssl/mywebsite.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mywebsite.42.fr/UID=mywebsite"
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/grafana.crt  -keyout /etc/nginx/ssl/grafana.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=grafana.42.fr/UID=grafana"

#NGINX CONF

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN chown -R nginx:nginx /var/www \
  && chown -R nginx:nginx /var/lib/nginx \
  && chown -R nginx:nginx /etc/nginx \
  && chmod 755 /var/www

# REDIRECT LOGS
RUN ln -sf /dev/stdout /var/log/nginx/access.log && ln -sf /dev/stderr /var/log/nginx/error.log

USER nginx

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]