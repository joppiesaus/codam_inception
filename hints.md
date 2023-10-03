`docker-compose build && docker run srcs-wordpress`
`docker run -it srcs-wordpress bash`

`docker run -it --rm -v srcs_www:/var/www srcs-wordpress bash`
`docker run -it --rm -v srcs_db:/var/lib/mysql srcs-mariadb bash`

start database
login: `mariadb --host localhost -u root`
