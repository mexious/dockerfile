#!/bin/bash

service mysql start
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;"
mysql -u root -e "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_PASS';"
mysql -u root -e "GRANT ALL PRIVILEGES ON $MARIADB_NAME.* TO '$MARIADB_USER'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"
mysql -u root -e "USE mysql; UPDATE user SET password=PASSWORD('$MARIADB_ROOT_PASS') WHERE User='root' AND Host = 'localhost';"
while true; do sleep 1000; done 