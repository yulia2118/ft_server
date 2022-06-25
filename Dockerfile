# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdarrin <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/29 15:49:36 by fdarrin           #+#    #+#              #
#    Updated: 2020/09/01 14:51:19 by fdarrin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt update
RUN apt install -y nginx openssl mariadb-server php-fpm php-mysql php-mbstring
RUN mkdir /etc/nginx/ssl
RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/wp.pem -keyout /etc/nginx/ssl/wp.key -subj "/C=RU/ST=MO/L=Moscow/O=School21/OU=fdarrin/CN=wp"


WORKDIR /var/www/wp
ADD ./srcs/init.sh /tmp
ADD ./srcs/wp /etc/nginx/sites-available/
ADD ./srcs/wp.tar.gz ./
ADD ./srcs/wordpress.sql ./
ADD ./srcs/autoindex.sh ./

ENTRYPOINT bash /tmp/init.sh

EXPOSE 80 443 3306
