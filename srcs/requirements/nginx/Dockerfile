FROM		debian:buster

RUN		apt-get update -y && apt-get install nginx -y && apt-get install openssl -y

RUN		mkdir /etc/nginx/ssl

COPY		./conf/nginx.conf /etc/nginx/sites-enabled/default
COPY		./tools/nginx.sh /var/www

RUN		chmod +x /var/www/nginx.sh
RUN		mkdir -p /run/nginx

ENTRYPOINT	["var/www/nginx.sh"]

EXPOSE		443

CMD		["nginx", "-g", "daemon off;"]
