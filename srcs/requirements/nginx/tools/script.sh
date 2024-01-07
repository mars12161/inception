#!/bin/bash

if [ ! -f /etc/nginx/ssl/nginx.cert ]; then
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 -sha256 -keyout /etc/nginx/ssl/nginx.key \
                -out /etc/nginx/ssl/nginx.crt \
                -subj "/C=DE/ST=Berlin/L=Berlin/O=42Berlin/OU=mschaub/CN=mschaub"
fi

exec "$@"
