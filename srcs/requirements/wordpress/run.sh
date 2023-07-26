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

    # create 
    chmod wp-config.php
fi

if [ -f wp-config.php ]
then
    echo Wordpress is already configured. skip.
else
    echo create wp config...

    wp core config --dbname="$DB_NAME" --dbhost=mariadb --dbuser="$DB_ADMIN_USER" --dbpass="$DB_ADMIN_PASSWORD" --dbcollate="utf8_general_ci" --allow-root

    # fix permissions
    chmod 644 wp-config.php


fi


unset DB_ADMIN_NAME
unset DB_ADMIN_PASSWORD

