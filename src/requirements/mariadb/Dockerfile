FROM debian:bullseye

WORKDIR /

RUN apt update ;\
	apt install -y \
	mariadb-server

RUN service mariadb start

EXPOSE 3306:3306/tcp
CMD ["bash"]