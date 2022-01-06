
# IMAGE
FROM debian:buster
LABEL maintainer="rchelsea"

# UPDATE AND INSTALL APPS
RUN apt update -y >> /dev/null 2>&1
RUN apt install -y mariadb-server >> /dev/null 2>&1

# COPY CONFIGS
COPY /tools/entrypoint.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh

COPY ./conf/my.cnf /etc/mysql/my.cnf
#By default, the bind-address is to ‘127.0.0.1.’
#You can configure your bind-address as ‘0.0.0.0’ for all Ip-Addresses.

RUN mkdir -p /var/run/mysqld
RUN chown -R mysql:mysql /var/run/mysqld

#OPEN PORT
EXPOSE 3306

# START CONTAINER
ENTRYPOINT	["/bin/sh", "/entrypoint.sh"]
