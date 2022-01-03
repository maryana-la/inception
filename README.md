# inception

docker images - to see images
docker ps - show running containers
docker ps -a - show all containers
docker ps -aq - show all containers, ID only
docker rm <name/id> - delete container
docker rm $(docker ps -aq) - передать в докер рм вывод команды в скобках

docker build -t name . построение образа
-t tag или имя
. dockerfile лежит в текущей папке

docker run -p 80:80 -p 443:443 -it --rm debian
docker run --rm -p 3306:3306 -it -v ~/desktop/tmp_base/mari/:/var/lib/mysql setevoy/ubuntu_14_mariadb_15.1


docker run --rm -it imagename containername -p numberofport_local:numberofport_docker 

-i убеждается, что STDIN держится открытым. Это необходимо для ввода команд в оболочку;
-t выделяет псевдотерминал (TTY).
--rm удаляет после выхода из контейнера
- e TZ=Europe/Moscow - добавить переменную окружения
- --name hello - name container hello
-d - запустить в фоновом режиме


VOLUME

docker exec -it wordpress bash - attach to container


Docker compose - yml

Dockerfile:
FROM
RUN mkdir.... - execute command
WORKDIR .... - go to dir??

COPY . /usr/dffd/... - copy files from .(current folder) to /usr/...
EXPOSE 8080 - declare a port

ENV TZ Europe/Moscow - добавить переменную окружения

CMD .... - run command inside container in bash
ENTRYPOINT .... - run command inside container not in bash



1. Изучите, что такое VirtualBox
2. Установка Debian на VirtualBox по шагам: https://poznyaev.ru/blog/linux/debian-v-virualbox
3. Ликбер по основным понятиям: https://severalnines.com/blog/how-deploy-mariadb-server-docker-container
4. https://dockerlabs.collabnix.com/beginners/components/container-vs-image.html
5. Что такое контейнер: https://www.docker.com/resources/what-container
6. Что такое docker-compose: https://docs.docker.com/compose/ , https://docs.docker.com/compose/reference/ , https://docs.docker.com/compose/gettingstarted/
7. .yml и команды: https://docs.docker.com/compose/compose-file/compose-file-v3/#short-syntax-3
8. Networks: https://docs.docker.com/compose/networking/
9. Compose + wordpress: https://docs.docker.com/samples/wordpress/
10. https://docs.docker.com/engine/install/debian/
11. https://docs.docker.com/compose/install/
12. https://docs.docker.com/engine/install/linux-postinstall/
13. Если проблемы с sudo: https://milq.github.io/enable-sudo-user-account-debian/
14. Добавление ssh для комфортной работы: https://losst.ru/nastrojka-ssh-v-debian + https:/wiki.debian.org/ru/DHCP_Client
15. TLS: https://habr.com/ru/post/258285/
16. Nginx + TLS: https://www.cyberciti.biz/faq/configure-nginx-to-use-only-tls-1-2-and-1-3/
17. .env: https://www.techrepublic.com/article/how-to-use-docker-env-file/
18. Default config php (можно просто через volume скопировать) https://www.inmotionhosting.com/support/website/what-is-your-default-php-ini-file/ , https://www.php.net/manual/ru/info.configuration.php
19. nginx fastcgi: https://nginx.org/en/docs/http/ngx_http_fastcgi_module.html#fastcgi_pass
20. Проблема с php-fpm: https://saribzhanov.ru/tehno/nastraivaem-rabotu-php-fpm-na-port-ili-na-soket/
21. Wordpress config: https://codex.wordpress.org/Редактирование_wp-config.php
22. Какая-то полезная ссылка: https://miac.volmed.org.ru/wiki/index.php/Docker-compose_настройка_для_сайта_NGINX_%2B_MYSQL_%2B_PHP-FPM
23. Очистка всего: https://linuxize.com/post/how-to-remove-docker-images-containers-volumes-and-networks/



sudo lsof -i @localhost:8080

mariadb:
https://hub.docker.com/_/mariadb
https://hevodata.com/learn/mariadb-docker/

mysql commands:
*   desc mysql.user;
*   STATUS
>   mysql -u root -p
Enter password: ***********
mysql> use mysql;
Database changed
mysql> SELECT user FROM user;

show databases;
show tables;
select * from wp_users;
select * from wp_users\G;
UPDATE wp_users SET user_pass=md5('enter new password here') WHERE user_login='admin';

6.) Delete all spam comments:

DELETE FROM `wp_comments` WHERE `comment_approved`='spam'



----------------yml_test-------------

version: "3.8"

services:
web:
build: ./ft_server
ports:
- 80:80
- 443:443
image: debian
container_name: server


----------------------- FT_SERVer-------------


https://harm-smits.github.io/42docs/projects/ft_server

про установку в докерфайле
Always combine RUN apt-get update with apt-get install in the same RUN statement.
https://docs.docker.com/develop/develop-images/dockerfile_best-practices/
Valgrind on Mojave using Docker
https://noahloomans.com/tutorials/docker-valgrind/
you need to learn Docker RIGHT NOW!! // Docker Containers 101
https://www.youtube.com/watch?v=eGz9DS-aIeY&t=872s


перед работой с докером сделать это:
cd goinfre
mkdir docker
rm -rf ~/Library/Containers/com.docker.docker
ln -s ~/goinfre/docker ~/Library/Containers/com.docker.docker

openssl req -newkey rsa:2048 -nodes -keyout domain.key -x509 -days 365 -out domain.crt
не помню куда это вставлять ахахахах но куда-то в конфиг nginx
service nginx start
почему надо скачивать определенную версию

Лучшие практики при написании безопасного Dockerfile
https://habr.com/ru/company/swordfish_security/blog/537280/
[42 ft_server] How to install LEMP + Wordpress on Debian buster by using Dockerfile — 2
https://forhjy.medium.com/42-ft-server-how-to-install-lemp-wordpress-on-debian-buster-by-using-dockerfile-2-4042adb2ab2c
Создание самоподписанного SSL-сертификата для Nginx в Ubuntu 16.04
https://abc-server.com/ru/blog/administration/creating-ssl-for-nginx-in-ubuntu-1604/
чеклист по серверу
https://github.com/kohyounghwan/ft_server% 
