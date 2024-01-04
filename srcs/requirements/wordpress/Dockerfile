FROM		debian:buster

RUN		apt-get update && apt-get install -y php7.3 php-mysqli php-fpm wget

EXPOSE		9000

COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY		./tools /var/www

RUN		chmod +x /var/www/script.sh

ENTRYPOINT	[ "/var/www/script.sh" ]
