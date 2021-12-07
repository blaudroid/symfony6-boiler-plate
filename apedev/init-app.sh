#! /bin/bash

chown -R www-data:www-data /var/www/html/var/

service apache2 start

#cd /var/www/html && composer install

while true; do
  sleep 1000
done
