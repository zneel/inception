FROM alpine:3.17

LABEL version="1.0"
LABEL description="mariadb"

ENV TERM xterm-256color

RUN apk update && apk add mariadb mariadb-client bash gettext
RUN mysql_install_db --basedir=/usr --datadir=/var/lib/mysql

RUN	mkdir -p /run/mysqld
RUN	chown -R mysql:mysql /run/mysqld

RUN	mkdir -p /var/lib/mysql
RUN	chown -R mysql:mysql /var/lib/mysql
RUN rm /etc/my.cnf.d/mariadb-server.cnf
COPY ./conf/mariad.cnf	/etc/my.cnf.d/mariad.cnf

EXPOSE 3306
COPY ./tools/start.sh /
COPY ./tools/script.sql /

CMD [ "bash", "start.sh" ]