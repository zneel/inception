#!/bin/sh
set -e
sed -i "s/;admin_user = admin/admin_user = ${GRAFANA_ADMIN_USER}/" /etc/grafana.ini
sed -i "s/;admin_password = admin/admin_password = ${GRAFANA_ADMIN_PASSWORD}/" /etc/grafana.ini

exec grafana-server -config /etc/grafana.ini -homepath /usr/share/grafana
