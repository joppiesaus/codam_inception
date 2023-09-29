#           ^^                   @@@@@@@@@
#      ^^       ^^            @@@@@@@@@@@@@@@
#                           @@@@@@@@@@@@@@@@@@              ^^
#                          @@@@@@@@@@@@@@@@@@@@
#~~~~ ~~ ~~~~~ ~~~~~~~~ ~~ &&&&&&&&&&&&&&&&&&&& ~~~~~~~ ~~~~~~~~~~~ ~~~
#~         ~~   ~  ~       ~~~~~~~~~~~~~~~~~~~~ ~       ~~     ~~ ~
#  ~      ~~      ~~ ~~ ~~  ~~~~~~~~~~~~~ ~~~~  ~     ~~~    ~ ~~~  ~ ~~
#  ~  ~~     ~         ~      ~~~~~~  ~~ ~~~       ~~ ~ ~~  ~~ ~
#~  ~       ~ ~      ~           ~~ ~~~~~~  ~      ~~  ~             ~~
#      ~             ~        ~      ~      ~~   ~             ~

all:
	cd srcs; docker-compose build mariadb nginx wordpress;
	cd srcs; docker-compose up;

down:
	cd srcs; docker-compose down

rmvolumes:
	cd srcs; docker-compose down --volumes

fclean: rmvolumes
	cd srcs; docker system prune --force --volumes --all


.PHONY: all rm_volumes fclean