FROM debian:buster
MAINTAINER Guillaume Dupont <gdupont@student.42.fr>

RUN apt-get update && apt-get upgrade -y

RUN apt-get install nginx -y


RUN apt-get install mariadb-server openssl -y
RUN apt-get install php7.3-cli php7.3-fpm php7.3-mysql php7.3-json php7.3-opcache php7.3-mbstring php7.3-xml php7.3-gd php7.3-curl -y
RUN apt-get install wget -y

RUN wget https://wordpress.org/latest.tar.gz
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
RUN mkdir /var/www/html/wordpress && mkdir /var/www/html/wordpress/phpmyadmin
RUN tar xf latest.tar.gz && mv wordpress/* /var/www/html/wordpress
RUN tar xf phpMyAdmin-4.9.0.1-all-languages.tar.gz && mv phpMyAdmin-4.9.0.1-all-languages/* /var/www/html/wordpress/phpmyadmin

RUN rm -rf /etc/nginx/sites-enabled/*
COPY srcs/config.nginx /etc/nginx/sites-available/config
RUN ln -s /etc/nginx/sites-available/config /etc/nginx/sites-enabled/

EXPOSE 80
ENTRYPOINT service php7.3-fpm start && nginx -g 'daemon off;'