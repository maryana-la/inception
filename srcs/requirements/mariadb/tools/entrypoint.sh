#!/bin/sh

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ];
then
  mysql_install_db --datadir=/var/lib/mysql/wordpress
  service mysql start
  mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`"
  mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}'"
  mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE} .* TO '${MYSQL_USER}'@'%'"
  mysql -e "FLUSH PRIVILEGES"

#add password to root user:
  mysqladmin -u root password ${ROOT_PASSWORD}
  mysql -e "FLUSH PRIVILEGES"
  service mysql stop
fi

exec /usr/sbin/mysqld
