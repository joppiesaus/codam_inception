# Welcome to my wordpress dockerfile.
# the quote for this file is: "you're acting a little amongus sus, joe"

FROM debian:bookworm

# the wordpress version to install. I'm calling it
# MY_WORDPRESS_VERSION because idk if WORDPRESS_VERSION
# is a wordpress thing I cannot touch
ENV MY_WORDPRESS_VERSION="6.2.2"

RUN echo "Using wordpress $MY_WORDPRESS_VERSION"
RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y wget php8.2-fpm php8.2-mysql tar

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

# Download wordpress
RUN wp core download --version="${MY_WORDPRESS_VERSION}" --allow-root

RUN apt-get install -y mariadb-client

#RUN mariadb --host mariadb -u $DB_ADMIN_NAME --password="$DB_ADMIN_PASSWORD"
CMD [ "mariadb",  "--host", "mariadb", "-u", "jeff", "--password=\"Jan Peter Balkenende\"" ]
#CMD echo hi
#CMD echo hi && sleep 99d
