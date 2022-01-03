#    Dockerfile-nginx

# IMAGE
FROM	debian:buster

# INSTALL APPS
RUN apt update -y
RUN apt -y install wget vim nginx

# GET ACCESS CONTROL
RUN chmod 755 /var/*

# GET CONF FROM SRCS
COPY ./conf/nginx.conf /etc/nginx/sites-available/default
# COPY ./conf/run.sh ./

# GET SSL SERTIFICATE

# -newkey rsa:bits generate a new RSA key of 'bits' in size
# -nodes: This option is deprecated since OpenSSL 3.0; use -noenc instead.
# -noenc: If this option is specified then if a private key is created it will not be encrypted.
# -newkey arg: This option is used to generate a new private key unless -key is given. It is subsequently used as if it was given using the -key option.
#  This option implies the -new flag to create a new certificate request or a new certificate in case -x509 is given.
# -x509: This option outputs a certificate instead of a certificate request. This is typically used to generate test certificates. It is implied by the -CA option.
# -days n: When -x509 is in use this specifies the number of days to certify the certificate for, otherwise it is ignored. n should be a positive integer. The default is 30 days.
# -subj arg:  Sets subject name for new request or supersedes the subject name when processing a certificate request.
# -keyout filename
#  This gives the filename to write any private key to that has been newly created or read from -key.
#  If neither the -keyout option nor the -key option are given then the filename specified in the configuration file with the default_keyfile option is used, if present.
#  Thus, if you want to write the private key and the -key option is provided, you should provide the -keyout option explicitly.
#  If a new key is generated and no filename is specified the key is written to standard output.
# -out filename: This specifies the output filename to write to or standard output by default.

RUN openssl req -newkey rsa:2048 -days 365 -noenc -x509 -keyout /etc/ssl/cert.key -out /etc/ssl/bundle.crt -subj "/C=RU/L=Kazan/OU=School_21/CN=rchelsea.42.fr"
RUN chmod 755 /etc/ssl/cert.key /etc/ssl/bundle.crt


# OPEN PORTS
EXPOSE 80 443
RUN chmod 755 run.sh

# RUN ARGS
# CMD sh run.sh

ENTRYPOINT ["nginx", "-g", "daemon off;"]
