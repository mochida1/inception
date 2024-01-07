# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mochida <mochida@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/07 16:43:14 by mochida           #+#    #+#              #
#    Updated: 2024/01/07 17:25:09 by mochida          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

MARIADB_VOL_DIR = volumes/mariadb
WP_VOL_DIR = volumes/wp


all: directories
	docker volume create --name mdb_data --opt type=none --opt device=../$(MARIADB_VOL_DIR) --opt o=bind
	docker volume create --name wp_data --opt type=none --opt device=../$(WP_VOL_DIR) --opt o=bind
	cd src && docker-compose up

directories:
	@mkdir -p volumes
	@mkdir -p $(MARIADB_VOL_DIR)
	@mkdir -p $(WP_VOL_DIR)

clean: fclean

fclean:
		docker system prune -af --volumes
		sudo rm -rf volumes