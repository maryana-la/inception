# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rchelsea <rchelsea@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/14 16:16:11 by rchelsea          #+#    #+#              #
#    Updated: 2021/04/14 17:28:56 by rchelsea         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# IMAGE
FROM	debian:buster

# INSTALL APPS
RUN apt update && apt -y update
RUN apt -y install wget vim nginx 
RUN apt -y install php7.3-fpm php-mysql php-mbstring 
RUN apt -y install default-mysql-server mariadb-server

# GET ACCESS CONTROL
RUN chmod 755 /var/*

# GET CONF FROM SRCS
COPY ./srcs/default /etc/nginx/sites-available/
COPY ./srcs/autoindex_off.sh ./
COPY ./srcs/autoindex_on.sh ./
COPY ./srcs/run.sh ./

# GET SSL SERTIFICATE
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=Kazan_21/OU=rchelsea/CN=localhost" -keyout /etc/ssl/cert.key -out /etc/ssl/bundle.crt
RUN chmod 755 /etc/ssl/cert.key /etc/ssl/bundle.crt

# INSTALLL PHP
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz
RUN tar -xzvf phpMyAdmin-4.9.7-all-languages.tar.gz
RUN rm -rf phpMyAdmin-4.9.7-all-languages.tar.gz
RUN mv phpMyAdmin-4.9.7-all-languages phpmyadmin
RUN mv phpmyadmin /var/www/html/

# INSTALL WORDPRESS
RUN wget https://wordpress.org/wordpress-5.6.tar.gz
RUN tar -xzvf wordpress-5.6.tar.gz
RUN rm -rf wordpress-5.6.tar.gz
RUN mv wordpress /var/www/html/

# GET ACCESS CONTROL
RUN chmod 755 /var/www/html/*
COPY srcs/wp-config.php /var/www/html/wordpress/

# OPEN PORTS
EXPOSE 80 443
RUN chmod 755 run.sh

# RUN ARGS
CMD sh run.sh
