#!/bin/sh


if [ -f "/var/www/hmochida/wordpress/wp-config.php" ]
then 

wp core download --allow-root --version=6.4 --path=/var/www/hmochida/wordpress
cd /var/www/hmochida/wordpress
wp config create --allow-root --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost="mariadb"
wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${SQL_USER} --admin_password=${SQL_PASSWORD} --admin_email=${WP_EMAIL} --skip-email
wp user create --allow-root ${WP_EDITOR_LOGIN} ${WP_EDITOR_MAIL} --role=${WP_EDITOR_ROLE} --user_pass=${WP_EDITOR_PASS}

fi

exec /usr/sbin/php-fpm7.4 -F