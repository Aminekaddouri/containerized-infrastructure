COMPOSE_FILE = srcs/docker-compose.yml
DATA_PATH = /home/akaddour/data

all: setup up

setup:
	@mkdir -p $(DATA_PATH)/wordpress
	@mkdir -p $(DATA_PATH)/mariadb

up:
	@sudo docker compose -f $(COMPOSE_FILE) up --build -d

down:
	@sudo docker compose -f $(COMPOSE_FILE) down

clean: down
	@sudo docker system prune -a --force

fclean: clean
	@sudo rm -rf $(DATA_PATH)/wordpress/*
	@sudo rm -rf $(DATA_PATH)/mariadb/*
	@docker compose -f $(COMPOSE_FILE) down -v

re: fclean all


.PHONY: all setup up down clean fclean re