#!/bin/sh

LOCK_FILE=/var/www/wordpress/setup.lock
if [ -f "$LOCK_FILE" ]; then
  echo "WordPress setup has already been completed, skipping..."
  exec php-fpm81 -F
fi
sleep 5
wp core download
wp config create \
  --dbname=${DB_NAME} \
  --dbuser=${DB_USER} \
  --dbpass=${DB_PASSWORD} \
  --dbhost=mariadb:3306 \
  --dbprefix=wp_ \
  --path=/var/www/wordpress \
  --allow-root \
  --skip-check \
  --force

wp core install \
  --url=${DOMAIN_NAME} \
  --title="inception ebouvier" \
  --admin_user=${WP_ADMIN} \
  --admin_password=${WP_ADMIN_PASSWORD} \
  --admin_email=${WP_ADMIN_EMAIL} \
  --path=/var/www/wordpress \
  --allow-root \
  --skip-email

wp user create ${WP_USER} ${WP_USER_EMAIL} --role=author --user_pass=${WP_PASSWORD} --allow-root

touch "$LOCK_FILE"

exec php-fpm81 -F
