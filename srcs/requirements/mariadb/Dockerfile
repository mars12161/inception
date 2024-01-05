FROM		debian:buster

RUN		apt-get update -y && apt-get install mariadb-server -y

EXPOSE		3306

COPY		./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY		./tools /var/www/

RUN		service mysql start && mysql < /var/www/init.sql && rm -f /var/www/init.sql;

CMD		["mysqld"]

