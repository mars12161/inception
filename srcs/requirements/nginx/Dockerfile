FROM		debian:buster

RUN		apt-get update -y && apt-get install nginx -y && apt-get install openssl -y

EXPOSE		443

COPY		./conf/nginx.conf /etc/nginx/sites-enabled/default
COPY		./tools/script.sh /var/www

RUN		chmod +x /var/www/script.sh

ENTRYPOINT	[ "var/www/script.sh" ]

CMD		["nginx", "-g", "daemon off;"]
