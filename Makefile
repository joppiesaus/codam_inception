all:
	cd srcs; docker-compose build mariadb nginx wordpress;
	cd srcs; docker-compose up;

rm_volumes:
	cd srcs; docker-compose down --volumes

fclean: rm_volumes
	cd srcs; docker system prune --force --volumes --all


.PHONY: all rm_volumes fclean