#!/bin/sh

if [ ! -d "/var/lib/mysql/wordpress" ]
then 

service mariadb start
sleep 5
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%'"
mysql -e "FLUSH PRIVILEGES"
mysql -u root --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
sleep 5

fi

exec mysqld -u root

# DATABASE_DIR="/var/lib/mysql/${MYSQL_DATABASE}"

# if [ ! -d "$DATABASE_DIR" ]; then
#     /usr/bin/mysqld_safe --datadir=/var/lib/mysql &

#     until mysqladmin ping 2> /dev/null; do
#         sleep 2
#     done

#     mysql -u root <<EOF
#         CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
        
#         ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
        
#         DELETE FROM mysql.user WHERE user='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
#         DELETE FROM mysql.user WHERE user='';
        
#         CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
#         GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
        
#         FLUSH PRIVILEGES;
# EOF

#     if [ $? -ne 0 ]; then
#         echo "Error: MySQL commands failed." >&2
#         exit 1
#     fi

#     killall mysqld 2> /dev/null
# fi

# exec "$@"