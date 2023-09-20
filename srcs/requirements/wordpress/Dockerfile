# Welcome to my wordpress dockerfile.
# the quote for this file is: "you're acting a little amongus sus, joe"

FROM debian:bookworm

# the wordpress version to install. I'm calling it
# MY_WORDPRESS_VERSION because idk if WORDPRESS_VERSION
# is a wordpress thing I cannot touch
ARG MY_WORDPRESS_VERSION
ARG DB_ADMIN_NAME
ARG DB_ADMIN_PASSWORD

# this has to be a joke
ENV MY_WORDPRESS_VERSION=${MY_WORDPRESS_VERSION}
ENV DB_ADMIN_NAME=${DB_ADMIN_NAME}
ENV DB_ADMIN_PASSWORD=${DB_ADMIN_PASSWORD}
ENV ADMIN_NAME=${ADMIN_NAME}
ENV ADMIN_PASSWORD=${ADMIN_PASSWORD}
ENV USER_NAME=${USER_NAME}
ENV USER_PASSWORD=${USER_PASSWORD}
ENV USER_EMAIL=${USER_EMAIL}

ENV DOMAIN="localhost:4430"
ENV TITLE="sussy among us blog"

RUN echo "Using wordpress $MY_WORDPRESS_VERSION"
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y wget php8.2-fpm php8.2-mysql tar mariadb-client

WORKDIR /tmp

# Download wp cli https://wp-cli.org
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# "install" it
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/bin/wp

# See if it works
RUN wp --info

RUN mkdir /var/www
WORKDIR /var/www

# Allow incoming connections for php
RUN sed -i "s/^listen\\s*=.*/listen = 0.0.0.0:9000/g" /etc/php/8.2/fpm/pool.d/www.conf
RUN grep "^listen" /etc/php/8.2/fpm/pool.d/www.conf

COPY run.sh /tmp/

# this doesn't do anything. but it does show it can log in to the database
#RUN apt-get install -y mariadb-client
#CMD [ "sh", "-c", "mariadb",  "--host", "mariadb", "-u", "${DB_ADMIN_NAME}", "--password=${DB_ADMIN_PASSWORD}" ]
CMD [ "bash", "/tmp/run.sh" ]
