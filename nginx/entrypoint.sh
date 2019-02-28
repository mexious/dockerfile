#!/bin/bash

sudo service nginx start
sed -i "s/localhost/$FQDN/g" /etc/nginx/sites-enabled/default.conf
sed -i "s/webroot/$WEBROOT/g" /etc/nginx/sites-enabled/default.conf
sed -i "s/php-fpm/$FPM/g" /etc/nginx/sites-enabled/default.conf
while true; do sleep 1d; done
exec "$@"