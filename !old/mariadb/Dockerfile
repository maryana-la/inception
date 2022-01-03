# IMAGE
FROM	debian:buster

RUN apt update && apt -y update
RUN apt -y install nano mariadb-server

RUN mkdir -p ~/Desktop/inception/mariadb/tmp/
COPY ./conf/wp_database.sql /tmp/
COPY ./conf/init_mdb.sh /tmp/
COPY ./conf/my.cnf /etc/mysql/



LABEL
RUN apk add --no-cache mariadb  mariadb-client
COPY conf/ /entrypoint/
COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld && \
    mkdir -p /home/mariadb && \
    chown -R mysql:mysql /home/mariadb
RUN mariadb-install-db --user=mysql --datadir='/home/mariadb'

WORKDIR		/entrypoint

# OPEN PORTS
EXPOSE 3306

# RUN ARGS
CMD sh run.sh
