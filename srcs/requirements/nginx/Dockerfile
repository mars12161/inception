FROM		debian:buster

RUN		apt-get update -y && apt-get install nginx -y && apt-get install openssl -y

RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt \
		-subj "/C=DE/ST=Berlin/L=Berlin/O=42Berlin/OU=mschaub/CN=mschaub"

COPY		./conf/default etc/nginx/sites-enabled/default

EXPOSE		443

CMD		["nginx", "-g", "daemon off;"]
