FROM debian:oldstable

WORKDIR /

RUN apt update &&\
	apt upgrade -y &&\
    apt install -y php7.4 \
                    php-fpm \
                    php-mysql \
                    mariadb-client \
                    curl

EXPOSE 9000

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
		chmod +x wp-cli.phar && \
		mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /var/www/hmochida/wordpress

RUN mkdir /run/php/

COPY ./entry.sh /usr/local/bin/entry.sh

# WORKDIR /var/www/hmochida/wordpress

EXPOSE 9000:9000/tcp

ENTRYPOINT ["entry.sh"]
CMD ["/usr/sbin/php-fpm7.4", "-F"]
