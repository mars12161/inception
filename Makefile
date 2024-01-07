all:
	@if  [ ! -d "/home/max/data" ]; then \
		mkdir /home/max/data; \
		mkdir /home/max/data/wordpress; \
		mkdir /home/max/data/mariadb; \
	fi
	@sudo docker-compose -f srcs/docker-compose.yml up -d

down:
	@sudo docker-compose -f srcs/docker-compose.yml down --rmi all -v

re:
	@sudo docker-compose -f srcs/docker-compose.yml up -d

fclean:
	@sudo docker system prune -a

.PHONY: all re down fclean
