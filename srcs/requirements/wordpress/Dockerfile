FROM		debian:buster

RUN		apt-get update && apt-get install -y php7.3 php-mysqli php-fpm wget sendmail

EXPOSE		9000

COPY		./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY		./conf /var/www/

CMD		["bash", "/var/www/script.sh"]
