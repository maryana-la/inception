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


docker run:
--name hello - name container hello
-d - запустить в фоновом режиме

docker run --rm -it imagename containername -p numberofport_local:numberofport_docker 

  -i убеждается, что STDIN держится открытым. Это необходимо для ввода команд в оболочку;
  -t выделяет псевдотерминал (TTY).
  --rm удаляет после выхода из контейнера
  - e TZ=Europe/Moscow - добавить переменную окружения

VOLUME


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
