FROM		debian:buster

RUN		apt-get update -y && apt-get install mariadb-server -y

ARG		MYSQL_HOSTNAME=${MYSQL_HOSTNAME}
ARG		MYSQL_DATABASE=${MYSQL_DATABASE}
ARG		MYSQL_USER=${MYSQL_USER}
ARG		MYSQL_PASSWORD=${MYSQL_PASSWORD}
ARG		MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ARG		WP_DOMAIN=${WP_DOMAIN}
ARG		WP_TITLE=${WP_TITLE}
ARG		WP_ADMIN=${WP_ADMIN}
ARG		WP_MAIL=${WP_MAIL}
ARG		WP_ADMIN_PASS=${WP_ADMIN_PASS}
ARG		WP_URL=${WP_URL}
ARG		WP_USER=${WP_USER}
ARG		WP_USER_MAIL=${WP_USER_MAIL}
ARG		WP_USER_PASS=${WP_USER_PASS}

EXPOSE		3306

COPY		./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY		./tools/script.sh /

RUN		chmod +x ./script.sh
RUN		bash ./script.sh
RUN		rm -rf script.sh

CMD		["mysqld_safe"]

