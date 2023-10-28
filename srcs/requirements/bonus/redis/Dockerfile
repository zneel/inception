FROM alpine:3.17

LABEL version="1.0"
LABEL description="redis"

RUN addgroup -S -g 1000 redis && adduser -S -G redis -u 999 redis

ENV TERM xterm-256color

RUN apk update && apk add redis gettext
RUN mkdir /data && chown redis:redis /data

VOLUME /data
WORKDIR /data
USER redis
CMD ["redis-server", "--protected-mode no"]