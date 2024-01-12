#!/bin/bash

service mysql start

mysql -uroot -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -uroot -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -uroot -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -uroot -e "FLUSH PRIVILEGES;"
mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

exec "$@"
