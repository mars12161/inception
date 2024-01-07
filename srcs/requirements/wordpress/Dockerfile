FROM		debian:buster

RUN		apt-get update && apt-get install -y curl \
		php7.3-fpm \
		php7.3-mysql \
		mariadb-client \
		&& rm -rf /var/lib/apt/lists/*

EXPOSE		9000

COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

ADD		https://wordpress.org/latest.tar.gz /var/www/latest.tar.gz

RUN		cd /var/www && tar -xvf latest.tar.gz && rm -rf latest.tar.gz

RUN		curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar --output /usr/bin/wp --silent

RUN		chmod +x ./usr/bin/wp

RUN		mkdir /run/php

COPY		./tools/script.sh /var/www/wordpress/script.sh

RUN		chmod +x /var/www/wordpress/script.sh

RUN ls -l /var/www/wordpress/
RUN ls -l /var/www/wordpress/script.sh

CMD		["bash", "/var/www/wordpress/script.sh"]

