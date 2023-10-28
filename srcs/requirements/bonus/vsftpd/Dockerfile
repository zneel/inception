FROM alpine:3.17

LABEL version="1.0"
LABEL description="vsftpd"

ENV TERM xterm-256color

RUN apk update && apk add vsftpd gettext
RUN mkdir -p /home/vsftpd/ /var/log/vsftpd
RUN chown -R ftp:ftp /home/vsftpd/
COPY ./conf/vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./tools/setup.sh /
CMD [ "sh", "setup.sh" ]