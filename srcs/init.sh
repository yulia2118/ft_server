# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init.sh                                            :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdarrin <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/30 15:28:20 by fdarrin           #+#    #+#              #
#    Updated: 2020/08/30 15:28:37 by fdarrin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Make wp site available and remove default nginx page
ln -s /etc/nginx/sites-available/wp /etc/nginx/sites-enabled/wp
rm -rf /etc/nginx/sites-enabled/default


#Create empty database and import data from dump
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'fdarrin'@'localhost' IDENTIFIED BY 'pass';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'fdarrin'@'localhost' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
mysql -u root "wordpress" < wordpress.sql

#Make autoindex executable
chmod +x autoindex.sh

#Start services
service nginx start
service php7.3-fpm start

bash
