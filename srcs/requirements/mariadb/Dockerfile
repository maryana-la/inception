
# IMAGE
FROM debian:buster
LABEL maintainer="rchelsea"
#LABEL — описывает метаданные. Например — сведения о том, кто создал и поддерживает образ.

# UPDATE AND INSTALL APPS
RUN apt update -y
RUN apt install -y mariadb-server

# COPY CONFIGS
COPY /tools/entrypoint.sh ./entrypoint.sh

RUN mkdir -p /var/run/mysqld &&	\
      chown -R mysql:mysql /var/run/mysqld &&	\
      rm /etc/mysql/mariadb.conf.d/50-server.cnf
# Swith off the bind address

#cannot start without this command:
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#By default, the bind-address is to ‘127.0.0.1.’
#Add bind address for your public Net Interface and another for Service Net interface.
#You can configure your bind-address as ‘0.0.0.0’ for all Ip-Addresses.

#OPEN PORT
EXPOSE 3306

# START CONTAINER
ENTRYPOINT	["/bin/sh", "/entrypoint.sh"]
