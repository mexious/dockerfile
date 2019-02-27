#!/bin/bash

sudo service mysql start
mysql -uroot -e "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MARIADB_ROOT_PASS'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON "$MARIADB_NAME".* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASS'"
mysql -uroot -e "FLUSH PRIVILEGES;"
while true; do sleep 1d; done 