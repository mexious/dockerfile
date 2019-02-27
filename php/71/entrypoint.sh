#!/bin/bash

sudo service php7.1-fpm start
until /usr/bin/pgrep php7.1-fpm > /dev/null; do sudo service php7.1-fpm start; done
exec "$@"