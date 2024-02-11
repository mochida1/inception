FROM debian:oldstable

RUN apt update &&\
	apt upgrade -y &&\
	apt install -y mariadb-server

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN mkdir /run/mysqld \
	&& chown -R mysql:mysql /run/mysqld

EXPOSE 3306

COPY entry.sh /

ENTRYPOINT ["sh", "/entry.sh"]

# RUN	apt-get update -y && \
# 	apt-get install -y \
# 	mariadb-server \
# 	mariadb-client

# RUN	mkdir -p /run/mysqld /var/lib/mysql /var/log/mysql/ && \
# 	chown -R mysql:mysql /run/mysqld /var/lib/mysql /var/log/mysql/ && \
# 	chmod 755 /var/log/mysql/

# RUN	mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal --skip-test-db

# COPY ./conf/my.cnf /etc/mysql/my.cnf
# RUN chmod 644 /etc/mysql/my.cnf

# COPY ./entry.sh /usr/local/bin/

# EXPOSE 3306

# ENTRYPOINT ["/usr/local/bin/entry.sh"]

# # Command launched at the end of the setup
# CMD ["/usr/bin/mysqld_safe", "--datadir=/var/lib/mysql"]


# --------------------------------------------------------------------
# RUN apt update &&\
# 	apt upgrade -y &&\
# 	apt install -y mariadb-server

# COPY	conf/50-server.cnf /etc/mysql/mariadb.conf.d/
# COPY	./entry.sh /usr/local/bin/

# RUN echo -e $MYSQL_ALLOW_EMPTY_PASSWORD $MYSQL_ROOT_PASSWORD $MYSQL_DATABASE $MYSQL_USER $MYSQL_PASSWORD
# RUN mkdir /run/mysqld \
# 	&& chown -R mysql:mysql /run/mysqld

# EXPOSE 3306:3306

# ENTRYPOINT ["entry.sh"]
# CMD ["mysqld", "-u root"]