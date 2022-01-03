all: up

up:
	mkdir -p ~/data/db;\
	mkdir -p ~/data/wp;\
	docker-compose -f srcs/docker-compose.yaml up -d

build:
	mkdir -p ~/data/db;\
	mkdir -p ~/data/wp;\
	docker-compose -f srcs/docker-compose.yaml up --build -d

ps:
	docker-compose -f srcs/docker-compose.yaml ps

down:
	docker-compose -f srcs/docker-compose.yaml down

clean: down
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi $$(docker images -qa);\
	docker network rm $$(docker network ls -q);\
	docker system prune -a

fclean: clean
	docker volume rm $$(docker volume ls -q);\
	rm -rf ~/data/wp;\
	rm -rf ~/data/db;\
	rm -rf ~/data;\

.PHONY:	all up down re ps rm
