#!/bin/sh

LOCK_FILE=/var/www/wordpress/setup.lock
if [ -f "$LOCK_FILE" ]; then
  echo "WordPress setup has already been completed, skipping..."
  exec php-fpm81 -F
fi

sleep 2
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
  --title="ebouvier" \
  --admin_user=${WP_ADMIN} \
  --admin_password=${WP_ADMIN_PASSWORD} \
  --admin_email=${WP_ADMIN_EMAIL} \
  --path=/var/www/wordpress \
  --allow-root \
  --skip-email

wp user create ${WP_USER} ${WP_USER_EMAIL} --role=author --user_pass=${WP_PASSWORD} --allow-root

wp config set WP_REDIS_HOST redis --allow-root
wp config set WP_REDIS_PORT 6379 --allow-root
wp plugin install redis-cache --activate --allow-root
wp plugin update --all --allow-root
wp redis enable --allow-root
chmod 777 -R /var/www/wordpress/wp-content/object-cache.php

touch "$LOCK_FILE"

exec php-fpm81 -F
