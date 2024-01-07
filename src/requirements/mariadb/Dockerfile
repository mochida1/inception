FROM debian:bookworm

WORKDIR /

RUN apt update ;\
	apt install -y \
	mariadb-server \
	nano

RUN service mariadb start

EXPOSE 3306:3306/tcp
CMD ["bash"]