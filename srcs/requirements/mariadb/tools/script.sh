#!/bin/bash

if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

if [ ! -d "/var/lib/mysql/mysql" ]; then

	chown -R mysql:mysql /var/lib/mysql
	mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql --rpm > /dev/null

	tempfile=$(mktemp)
	if [ ! -f "$tempfile" ]; then
		return 1
	fi

	cat << EOF > "$tempfile"
	
USE mysql;
FLUSH PRIVILEGES;

DELETE FROM mysql.user WHERE User='';
DROP DATABASE test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.db WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
ALTER USER 'root'@'localhost' IDENTIFIED BY '$rootpw';
CREATE DATABASE '$dbname' CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '$username'@'%' IDENTIFIED BY '$dbpasswd';
GRANT ALL PRIVILEGES ON $dbname.* TO '$username'@'%';

FLUSH PRIVILEGES;
EOF
	/usr/sbin/mysqld --user=mysql --bootstrap < "$tempfile"
	rm -f "$tempfile"

fi

sed -i "s|skip-networking|# skip-networking|g" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/mariadb.conf.d/50-server.cnf

exec /usr/sbin/mysqld --user=mysql --console
