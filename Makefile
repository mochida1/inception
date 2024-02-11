# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mochida <mochida@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/07 16:43:14 by mochida           #+#    #+#              #
#    Updated: 2024/01/07 19:47:09 by mochida          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#Your volumes will be available in the /home/login/data folder of the
# host machine using Docker. Of course, you have to replace the login
# with yours.

MARIADB_VOL_DIR = mariadb
WP_VOL_DIR = wp
VOL_BASE_DIR = /home/hmochida/data


all: directories
	docker volume create --name mdb_data --opt type=none --opt device=$(VOL_BASE_DIR)/$(MARIADB_VOL_DIR) --opt o=bind
	docker volume create --name wp_data --opt type=none --opt device=$(VOL_BASE_DIR)/$(WP_VOL_DIR) --opt o=bind
	cd src && sudo docker-compose up --build

directories:
	@sudo mkdir -p $(VOL_BASE_DIR)
	@sudo chmod -R 777 $(VOL_BASE_DIR)
	@mkdir -p $(VOL_BASE_DIR)/$(MARIADB_VOL_DIR)
	@mkdir -p $(VOL_BASE_DIR)/$(WP_VOL_DIR)

clean: fclean

fclean:
		cd src && docker-compose down
		docker system prune -af --volumes
		docker volume prune -f
		echo "deleting docker volumes"
		@docker volume rm mdb_data -f
		@docker volume rm wp_data -f
		sudo rm -rf $(VOL_BASE_DIR)