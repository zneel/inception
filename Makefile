all: up
build:
	docker-compose -f ./srcs/docker-compose.yml build
up:
	docker-compose -f ./srcs/docker-compose.yml up -d
down:
	docker-compose -f ./srcs/docker-compose.yml down
logs:
	docker-compose -f ./srcs/docker-compose.yml logs -f
rebuild: down build up
.PHONY: all build up down logs rebuild