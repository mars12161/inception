#!bin/bash

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
	echo "Setting up SSL";
	openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/max.key -out /etc/ssl/certs/nginx.crt \
	-subj "/C=DE/ST=Berlin/L=Berlin/O=42B/CN=max";
fi;

exec "$@"
