FROM debian:bullseye

WORKDIR /

RUN apt update ;\
	apt install -y \
	wget \
	php7.4-fpm

EXPOSE 9000:9000/tcp

CMD ["/usr/sbin/php-fpm7.4", "--nodaemonize"]