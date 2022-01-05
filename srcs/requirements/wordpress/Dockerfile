
# IMAGE
FROM debian:buster
LABEL maintainer="rchelsea"

# UPDATE AND INSTALL APPS
RUN apt update -y
RUN apt install -y php7.3 php7.3-fpm php-mysql mariadb-client curl

#GET WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

#COPY CONFIGS
COPY tools/entrypoint.sh /entrypoint.sh
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

WORKDIR /var/www/html

#OPEN PORT
EXPOSE 9000

# START CONTAINER
ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
CMD ["php-fpm7.3", "-F"]
