FROM		debian:buster

RUN		apt-get update -y && apt-get install nginx -y && apt-get install openssl -y

RUN		mkdir /etc/nginx/ssl

COPY		./conf/nginx.conf /etc/nginx/sites-enabled/default
COPY		./tools/script.sh /var/www

RUN		chmod +x /var/www/script.sh
RUN		mkdir -p /run/nginx

ENTRYPOINT	["var/www/script.sh"]

EXPOSE		443

CMD		["nginx", "-g", "daemon off;"]
