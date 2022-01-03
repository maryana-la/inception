#    Dockerfile-wordpress

# IMAGE
FROM	debian:buster

# INSTALL APPS
RUN apt update -y
RUN apt -y install wget vim
RUN apt -y install php7.3-fpm   

# GET ACCESS CONTROL
RUN chmod 755 /var/*

# GET CONF FROM SRCS
COPY ./srcs/default /etc/nginx/sites-available/
COPY ./srcs/autoindex_off.sh ./
COPY ./srcs/autoindex_on.sh ./
COPY ./srcs/run.sh ./

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
EXPOSE 9000 3306
RUN chmod 755 run.sh

# RUN ARGS
CMD sh run.sh