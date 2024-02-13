#!/bin/sh


if [ -f "/var/www/hmochida/wordpress/wp-config.php" ]
then 

sleep 5

else

sleep 20
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --allow-root --version=6.4 --path=/var/www/hmochida/wordpress
cd /var/www/hmochida/wordpress
wp config create --allow-root --dbname=${SQL_DATABASE} --dbuser=${SQL_USER} --dbpass=${SQL_PASSWORD} --dbhost="mariadb"
wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${SQL_USER} --admin_password=${SQL_PASSWORD} --admin_email=${WP_EMAIL} --skip-email
wp user create --allow-root ${WP_EDITOR_LOGIN} ${WP_EDITOR_MAIL} --role=${WP_EDITOR_ROLE} --user_pass=${WP_EDITOR_PASS}
wp post generate --count=1 --post_author="${WP_EDITOR_LOGIN}" --post_title="screw inception :|" --allow-root

fi

exec /usr/sbin/php-fpm7.4 -F
