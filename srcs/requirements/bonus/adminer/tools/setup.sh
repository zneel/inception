#!/bin/sh

LOCK_FILE=/var/www/adminer/setup.lock
if [ -f "$LOCK_FILE" ]; then
  echo "Adminer setup has already been completed, skipping..."
  exec php-fpm81 -F
fi

curl -OL https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
mv adminer-4.8.1.php index.php

touch "$LOCK_FILE"

exec php-fpm81 -F
