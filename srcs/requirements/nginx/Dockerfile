FROM		debian:buster

RUN		apt-get update -y && apt-get install nginx -y && apt-get install openssl -y

RUN		mkdir /etc/nginx/ssl

RUN		openssl req -nodes -days 365 -newkey rsa:4096 -x509 -sha256  \
		-out /etc/nginx/ssl/mschaub.pem \
		-keyout /etc/nginx/ssl/mschaub.key \
		-subj "/C=GER/ST=BERLIN/L=BERLIN/O=42Berlin/OU=test/CN=test/"

RUN		mkdir -p /run/nginx

COPY		conf/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT	["nginx", "-g", "daemon off;"]

