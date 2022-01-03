FROM		alpine:3.12
LABEL		maintainer="rchelsea"

RUN		apk update && apk add --no-cache openssl && apk add --no-cache nginx
COPY		./srcs/nginx.conf /etc/nginx/http.d/default.conf
RUN		ln -fs /etc/nginx/http.d/default.conf /etc/nginx/conf.d/default.conf	\
&&		openssl req -x509 -nodes						\
		-subj '/C=FR/ST=PARIS/L=PARIS/O=rchelsea/CN=localhost'			\
		-days 365 -newkey rsa:2048 -keyout /etc/ssl/private/ssl.key		\
		-out /etc/ssl/certs/ssl.crt						\
&&		mkdir -p /run/nginx 

WORKDIR		/app
EXPOSE		443
ENTRYPOINT	["nginx", "-g", "daemon off;"]
