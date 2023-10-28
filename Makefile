all: up

folders:
	mkdir -p $(HOME)/data/nginx/adminer
	mkdir -p $(HOME)/data/nginx/wordpress
	mkdir -p $(HOME)/data/mariadb

build:
	docker-compose -f ./srcs/docker-compose.yml build

up: folders
	docker-compose -f ./srcs/docker-compose.yml up -d

down:
	docker-compose -f ./srcs/docker-compose.yml down

logs:
	docker-compose -f ./srcs/docker-compose.yml logs -f

stop:
	docker-compose -f ./srcs/docker-compose.yml stop

clean: stop
	docker system prune -a -f

fclean: clean rm_volume
	sudo rm -rf $(HOME)/data

rm_volume:
	docker volume rm inception_mariadb || true
	docker volume rm inception_nginx || true

re: fclean all logs

.PHONY: all build up down logs rebuild