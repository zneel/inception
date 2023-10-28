FROM alpine:3.17

LABEL version="1.0"
LABEL description="grafana"

ENV TERM xterm-256color

RUN apk update && apk add grafana
RUN chown -R grafana:grafana /usr/share/grafana
USER grafana
CMD [ "grafana-server", "-config", "/etc/grafana.ini", "-homepath", "/usr/share/grafana" ]