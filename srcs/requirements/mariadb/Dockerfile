FROM alpine:3.17

LABEL version="1.0"
LABEL description="mariadb"

RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client openrc bash vim
RUN mysql_install_db --user=mysql

EXPOSE 3306
# HEALTHCHECK --start-period=5m \
#   CMD mariadb -e 'SELECT @@datadir;' || exit 1
# USER mysql
#/etc/my.cnf.d/mariadb-server.cnf
CMD ["mysqld_safe"]