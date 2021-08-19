# IMAGE
FROM	debian:buster

# INSTALL APPS
RUN apt update -y
RUN apt -y install wget vim nginx

# GET ACCESS CONTROL
RUN chmod 755 /var/*

# GET CONF FROM SRCS
COPY ./srcs/default /etc/nginx/sites-available/
COPY ./srcs/run.sh ./

# GET SSL SERTIFICATE
RUN openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=Kazan_21/OU=rchelsea/CN=localhost" -keyout /etc/ssl/cert.key -out /etc/ssl/bundle.crt
RUN chmod 755 /etc/ssl/cert.key /etc/ssl/bundle.crt


# OPEN PORTS
EXPOSE 80 443
RUN chmod 755 run.sh

# RUN ARGS
# CMD sh run.sh

ENTRYPOINT ["nginx", "-g", "daemon off;"]
