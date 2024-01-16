#!/bin/sh

cd /var/www/wordpress
	
wp core config --dbhost=mariadb --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER \
	--dbpass=$MYSQL_PASSWORD --allow-root

wp core install --title=inception --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASS \
	--admin_email=$WP_MAIL --url=$WP_URL --allow-root

wp user create $MYSQL_USER $WP_USER_MAIL --role=author --user_pass=$MYSQL_PASSWORD --allow-root

cd -

/usr/sbin/php-fpm7.3 -F

exec "$@"
