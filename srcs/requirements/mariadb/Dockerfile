FROM		debian:buster

RUN		apt-get update -y && apt-get install mariadb-server mariadb-client -y

COPY		tools/script.sh /tmp/script.sh

ENTRYPOINT	["sh", "/tmp/script.sh"]

