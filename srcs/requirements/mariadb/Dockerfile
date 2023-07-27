FROM debian:bookworm

ARG DB_NAME
ARG DB_ADMIN_NAME
ARG DB_ADMIN_PASSWORD

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y mariadb-client mariadb-server

WORKDIR /tmp
COPY expand_vars.sh ./
COPY initdb_unexpanded.sql ./

RUN chmod +x expand_vars.sh

# expand the variables in the database init SQL script.
# you could also do this while feeding it straight into mariadb.
# However, for debugging purposes, this is better.
RUN ./expand_vars.sh initdb_unexpanded.sql > initdb.sql

# this is in one line because otherwise it doesn't wait until the server started or something idk
RUN service mariadb start && echo -n "Creating database..." && mariadb -h localhost -u root < initdb.sql && echo " Done."

# Allow remote connections in mariadb
RUN sed -i "s/^bind-address/# bind-address/" /etc/mysql/mariadb.conf.d/50-server.cnf

RUN echo "[mysqld]" >> /etc/mysql/mariadb.conf.d/50-server.cnf
RUN echo "bind-address = 0.0.0.0" >> /etc/mysql/mariadb.conf.d/50-server.cnf

CMD [ "mariadbd", "--user=mysql" ]
