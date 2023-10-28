FROM alpine:3.17

LABEL version="1.0"
LABEL description="prometheus"

ENV TERM xterm-256color

RUN apk update && apk add prometheus

COPY ./conf/prometheus-docker.yml /etc/prometheus/prometheus.yml

ENTRYPOINT ["prometheus", "--config.file", "/etc/prometheus/prometheus.yml"]