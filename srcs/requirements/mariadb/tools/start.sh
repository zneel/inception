#!/bin/bash
set -e

LOCK_FILE=/var/lib/mysql/setup.lock

if [ -f "$LOCK_FILE" ]; then
  echo "Setup has already been completed, skipping..."
  exec mariadbd --user=mysql --console
fi

mariadbd &
pid="$!"
echo "pid: $pid"

while ! mysqladmin ping -hlocalhost --silent; do
  sleep 1
done

envsubst <script.sql >script_env.sql
mariadb <script_env.sql

if ! kill -s TERM "$pid" || ! wait "$pid"; then
  echo >&2 'MariaDB init process failed.'
  exit 1
fi

touch "$LOCK_FILE"

exec mariadbd --user=mysql --console
