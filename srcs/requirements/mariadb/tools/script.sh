#!/bin/bash


sleep 5;

service mysql start

mysql -uroot -p"rootpass" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -uroot -p"rootpass" -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -uroot -p"rootpass" -e "CREATE USER IF NOT EXISTS ${MYSQL_USER}@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -uroot -p"rootpass" -e "GRANT ALL PRIVILEGES ON *.* TO ${MYSQL_USER}@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -uroot -p"rootpass" -e "FLUSH PRIVILEGES;"

exec "$@"
