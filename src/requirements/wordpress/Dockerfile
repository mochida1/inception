FROM debian:oldstable

RUN apt update &&\
	apt upgrade -y &&\
    apt install -y php7.4 \
                    php-fpm \
                    php-mysql \
                    mariadb-client \
                    curl

EXPOSE 9000

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir -p /var/www/hmochida/wordpress

RUN mkdir /run/php/

RUN	chown -R root:root /var/www/hmochida/wordpress/

COPY entry.sh /
ENTRYPOINT ["sh", "/entry.sh"]

CMD ["/usr/sbin/php-fpm7.4", "-F"]
