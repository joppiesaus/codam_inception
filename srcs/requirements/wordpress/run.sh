#!/usr/bin/env bash
echo "Starting the wordpress run script"
env
echo "whoami: $(whoami)"

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

    tries=0

    while : ; do
        wp core config --dbname="$DB_NAME" --dbhost="mariadb" --dbuser="$DB_ADMIN_NAME" --dbpass="$DB_ADMIN_PASSWORD" --dbcollate="utf8_general_ci" --allow-root

        # try again when it fails. Usually means database wasn't up yet for unclear reasons.
        if [ $? -eq 0 ]; then
            break
        fi
        let "tries=tries+1"
        if [ $tries -eq 7 ]; then
            echo "max tries ($tries) exceeded, giving up."
            exit 1
        fi
        echo wp core cfg failed, trying again in a few seconds...
        sleep 5
    done

    # fix permissions
    chmod 644 wp-config.php

    # install wp core
    wp core install --url="$WP_DOMAIN" --title="$TITLE" --admin_user="$ADMIN_NAME" --admin_password="$ADMIN_PASSWORD" --skip-email --admin_email="does_not_exist___@student.codam.nl" --locale="en_GB" --allow-root

    echo create regular user
    # annoying inconsistency: for wp core install it is --admin_password, for wp user create it is --user_pass
    wp user create "$USER_NAME" "$USER_EMAIL" --user_pass="$USER_PASSWORD" --description="Epic regular user" --allow-root
fi

unset DB_ADMIN_NAME
unset DB_ADMIN_PASSWORD
unset ADMIN_NAME
unset ADMIN_PASSWORD
unset USER_NAME
unset USER_PASSWORD
unset USER_EMAIL
unset WP_DOMAIN

echo Setting correct permissions for uploads...
mkdir -p wp-content/uploads
chmod 775 -R wp-content/uploads
chown -R www-data:www-data wp-content/uploads

echo "Running PHP in foreground(-F) now..."
/usr/sbin/php-fpm8.2 -F 