# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    autoindex.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: fdarrin <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/08/30 16:58:30 by fdarrin           #+#    #+#              #
#    Updated: 2020/08/30 16:58:36 by fdarrin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

read -p 'Enable autoindex? yes/no: ' ans
  if [ $ans = "yes" ] || [ $ans = "y" ]
    then
      sed -i "s/autoindex off/autoindex on/g" /etc/nginx/sites-available/wp
      service nginx restart
      echo "autoindex is ON"
  elif [ $ans = "no" ] || [ $ans = "n" ]
    then
      sed -i "s/autoindex on/autoindex off/g" /etc/nginx/sites-available/wp
      service nginx restart
      echo "autoindex is OFF"
  fi
