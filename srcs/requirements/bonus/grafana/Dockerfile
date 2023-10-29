FROM alpine:3.17

LABEL version="1.0"
LABEL description="grafana"

ENV TERM xterm-256color

RUN apk update && apk add grafana
COPY ./tools/setup.sh .
CMD [ "sh", "setup.sh" ]