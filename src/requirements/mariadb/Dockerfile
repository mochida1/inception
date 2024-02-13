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
