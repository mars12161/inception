#!/bin/bash

chown -R www-data /var/www/wordpress
chmod -R 755 /var/www/wordpress;

mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ ! -f /var/www/wordpress/wp-config.php ]; then
	echo "Setting up wordpress"
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	mv wp-cli.phar /usr/local/bin/wp;

	cd /var/www/wordpress;
	wp core download --allow-root;

	mv /var/www/cp-config.php /var/www/wordpress/
	echo "Creating wordpress admin and user"
	wp core install --allow-root --url=${URL} --title${TITLE} --admin_user${WP_ADMIN} --admin_password=${WP_ADMIN_PW} --admin_email=${WP_ADMIN_MAIL};
	wp user create --allow-root ${WP_USER} ${WP_USER_MAIL} --user-pass=${WP_USER_PW};

fi

/usr/sbin/php-fpm7.3 -F
