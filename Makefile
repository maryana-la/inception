all: up

setup:
	mkdir -p ~/data/db
	mkdir -p ~/data/wp
	sudo sed -i "1i\127.0.0.1\trchelsea.42.fr" /etc/hosts
	sudo sed -i "1i\127.0.0.1\twww.rchelsea.42.fr" /etc/hosts

up:
	docker-compose -f srcs/docker-compose.yaml up -d

build:
	mkdir -p ~/data/db;\
	mkdir -p ~/data/wp;\
	docker-compose -f srcs/docker-compose.yaml up --build -d

ps:
	docker-compose -f srcs/docker-compose.yaml ps

down:
	docker-compose -f srcs/docker-compose.yaml down

fclean: down
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi $$(docker images -qa);\
	docker system prune -a -f;\
	docker volume rm $$(docker volume ls -q);\
	sudo rm -rf ~/data/wp;\
	sudo rm -rf ~/data/db;\
	sudo rm -rf ~/data;\
	sudo rm -rf ~/.docker;\
	sudo sed -i "/127.0.0.1\trchelsea.42.fr/d" /etc/hosts;\
	sudo sed -i "/127.0.0.1\twww.rchelsea.42.fr/d" /etc/hosts

.PHONY:	all up build ps down clean fclean



