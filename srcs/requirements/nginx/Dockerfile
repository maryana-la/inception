
# IMAGE
FROM debian:buster
LABEL maintainer="rchelsea"

# UPDATE AND INSTALL APPS
RUN apt update -y >> /dev/null 2>&1
RUN apt install -y nginx openssl >> /dev/null 2>&1
RUN rm -rf /etc/nginx/sites-available/default
RUN rm -rf /etc/nginx/sites-enabled/default

# COPY & LAUNCH CONFIGS
COPY ./conf/nginx.conf /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# GET SSL
RUN openssl req -x509 -nodes -subj '/C=RU/ST=TATARSTAN/L=KAZAN/O=rchelsea/CN=rchelsea.42.fr' \
            -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl.key -out /etc/ssl/certs/ssl.crt

#RUN mkdir -p /run/nginx

#OPEN PORT
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
