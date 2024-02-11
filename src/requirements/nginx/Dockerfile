# sudo docker build . -t img_nginx
# docker run -d -p 443:443 --name nginx img_nginx
FROM debian:bullseye

WORKDIR /

RUN apt update ;\
	apt install -y \
	nginx \
	openssl

EXPOSE 80:80/tcp 443:443/tcp
COPY default /etc/nginx/sites-available/default
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]