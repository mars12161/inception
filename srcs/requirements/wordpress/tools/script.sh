#!/bin/bash

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/html/wp-config.php ]; then
	echo "Setting up wordpress"
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root;
	echo "Creating wordpress admin and user"
	wp core install --allow-root --url=${URL} --title${TITLE} --admin_user${WP_ADMIN} --admin_password=${WP_ADMIN_PW} --admin_email=${WP_ADMIN_MAIL};
	wp user create --allow-root ${WP_USER} ${WP_USER_MAIL} --user-pass=${WP_USER_PW};

fi

exec "$@"
