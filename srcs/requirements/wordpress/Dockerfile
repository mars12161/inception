FROM		debian:buster

EXPOSE		9000

RUN		apt-get update && apt-get install -y curl \
		php7.3-fpm \
		php7.3-mysql \
		mariadb-client \
		&& rm -rf /var/lib/apt/lists/*

ARG             MYSQL_HOSTNAME=${MYSQL_HOSTNAME}
ARG             MYSQL_DATABASE=${MYSQL_DATABASE}
ARG             MYSQL_USER=${MYSQL_USER}
ARG             MYSQL_PASSWORD=${MYSQL_PASSWORD}
ARG             MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ARG             WP_DOMAIN=${WP_DOMAIN}
ARG             WP_TITLE=${WP_TITLE}
ARG             WP_ADMIN=${WP_ADMIN}
ARG             WP_MAIL=${WP_MAIL}
ARG             WP_ADMIN_PASS=${WP_ADMIN_PASS}
ARG             WP_URL=${WP_URL}
ARG             WP_USER=${WP_USER}
ARG             WP_USER_MAIL=${WP_USER_MAIL}
ARG             WP_USER_PASS=${WP_USER_PASS}

COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d

ADD		https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

RUN		cd /var/www && tar -xvf latest.tar.gz && rm -rf latest.tar.gz

RUN		curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent

RUN		chmod +x ./usr/bin/wp

RUN		mkdir /run/php

COPY		./tools/config.sh /var/www/wordpress/config.sh
RUN		chmod +x /var/www/wordpress/config.sh
CMD		["bash", "/var/www/wordpress/config.sh"]



