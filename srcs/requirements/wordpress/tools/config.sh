#!/bin/sh

cd /var/www/wordpress

wp core config --dbhost=$MYSQL_HOSTNAME --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD --allow-root

wp core install --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS \
	--admin_email=$WP_MAIL --url=${WP_URL} --allow-root

wp user create $WP_USER $WP_USER_MAIL --role=author --user_pass=$WP_USER_PASS --allow-root

cd -

echo "Current directory: $(pwd)"
ls -l /var/www/wordpress

/usr/sbin/php-fpm7.3 -F

exec "$@"
