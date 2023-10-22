all: up
build:
	cd srcs && docker-compose build
up:
	cd srcs && docker-compose up -d
down:
	cd srcs && docker-compose down
logs:
	cd srcs && docker-compose logs -f
rebuild: down build up
.PHONY: all build up down logs rebuild