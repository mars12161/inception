#!/bin/bash


sleep 5;

service mysql start

mysql -uroot -p"rootpass" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootpass';"
mysql -uroot -p"rootpass" -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -uroot -p"rootpass" -e "CREATE USER IF NOT EXISTS 'lituser'@'localhost' IDENTIFIED BY 'litpw';"
mysql -uroot -p"rootpass" -e "GRANT ALL PRIVILEGES ON *.* TO 'lituser'@'%' IDENTIFIED BY 'litpw';"
#mysql -uroot -p"rootpass" -e "GRANT ALL PRIVILEGES ON *.* TO 'lituser'@'localhost' WITH GRANT OPTION;"
mysql -uroot -p"rootpass" -e "FLUSH PRIVILEGES;"

exec "$@"
