# sudo docker build . -t img_nginx
# sudo docker run -d -p 443:443 --name nginx img_nginx
FROM debian:oldstable

RUN apt update &&\
	apt upgrade -y &&\
	apt install -y nginx\
	openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=FR/L=Paris/O=42/CN=hmochida.42.fr"

EXPOSE 443

COPY conf/hmochida /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/hmochida /etc/nginx/sites-enabled/ && \
	unlink /etc/nginx/sites-enabled/default && \
	mkdir /var/www/hmochida

RUN chmod 755 /var/www/hmochida
RUN chown -R www-data:www-data /var/www/hmochida

ENTRYPOINT ["nginx", "-g", "daemon off;"]