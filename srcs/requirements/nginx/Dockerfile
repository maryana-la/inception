
# IMAGE
FROM alpine:3.12
LABEL maintainer="rchelsea"

# UPDATE AND INSTALL APPS
RUN apk update && apk add --no-cache openssl && apk add --no-cache nginx

# COPY & LAUNCH CONFIGS
COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf
RUN ln -fs /etc/nginx/http.d/default.conf /etc/nginx/conf.d/default.conf

# GET SSL
RUN openssl req -x509 -nodes -subj '/C=RU/ST=TATARSTAN/L=PARIS/O=rchelsea/CN=localhost' \
            -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl.key -out /etc/ssl/certs/ssl.crt

RUN mkdir -p /run/nginx

#OPEN PORT
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]
