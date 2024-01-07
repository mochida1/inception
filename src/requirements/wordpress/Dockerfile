FROM debian:bookworm

WORKDIR /

RUN apt update ;\
	apt install -y \
	wget \
	php-fpm \
	nano

EXPOSE 9000:9000/tcp

CMD ["/usr/sbin/php-fpm8.2", "--nodaemonize"]