#!/usr/bin/env bash
echo "Starting the wordpress run script"
env
pwd

# Check if wordpress is installed
if [ -f wp-login.php ]
then
    echo Wordpress is already downloaded. skip.
else
    # Download wordpress
    wp core download --version="$MY_WORDPRESS_VERSION" --allow-root

fi

if [ -f wp-config.php ]
then
    echo Wordpress is already configured. skip.
else
    echo create wp config...

    wp core config --dbname="$DB_NAME" --dbhost="mariadb" --dbuser="$DB_ADMIN_NAME" --dbpass="$DB_ADMIN_PASSWORD" --dbcollate="utf8_general_ci" --allow-root

    # fix permissions
    chmod 644 wp-config.php

    # install wp core
    wp core install --url="$DOMAIN" --title="$TITLE" --admin_user="$ADMIN_NAME" --admin_password="$ADMIN_PASSWORD" --skip-email --admin_email="does_not_exist___@student.codam.nl" --locale="en_GB" --allow-root

    # TODO: user
fi


unset DB_ADMIN_NAME
unset DB_ADMIN_PASSWORD
unset ADMIN_NAME
unset ADMIN_PASSWORD

echo "Running PHP in foreground(-F) now..."
/usr/sbin/php-fpm8.2 -F 