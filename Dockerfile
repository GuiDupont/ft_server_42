FROM debian:buster
MAINTAINER Guillaume Dupont <gdupont@student.42.fr>

#ENVIRONNEMENT UPDATE & UPGRADE
RUN apt-get update && apt-get upgrade -y

#TOOLS INSTALLATION
RUN apt-get install wget -y

#NGINX SETUP
RUN apt-get install nginx -y
RUN rm -rf /etc/nginx/sites-enabled/*
COPY srcs/config.nginx /etc/nginx/sites-available/config
RUN ln -s /etc/nginx/sites-available/config /etc/nginx/sites-enabled/

#MARIADB SETUP
RUN apt-get install mariadb-server openssl -y

#WP 
RUN wget https://wordpress.org/latest.tar.gz
RUN mkdir /var/www/html/wordpress
RUN tar xf latest.tar.gz && mv wordpress/* /var/www/html/wordpress
#COPY srcs/wp-config.php  /var/www/html/wordpress/

#PHPMYADMIN SETUP
RUN mkdir /var/www/html/wordpress/phpmyadmin
RUN apt-get install php7.3-cli php7.3-fpm php7.3-mysql php7.3-json php7.3-opcache php7.3-mbstring php7.3-xml php7.3-gd php7.3-curl -y
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.5/phpMyAdmin-4.9.5-all-languages.tar.gz
RUN tar xf phpMyAdmin-4.9.5-all-languages.tar.gz && mv phpMyAdmin-4.9.5-all-languages/* /var/www/html/wordpress/phpmyadmin
#COPY srcs/config.inc.php /var/www/html/wordpress/phpmyadmin/

#SSL KEY GENERATION
RUN mkdir /etc/nginx/certs
RUN openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -batch -nodes
RUN mv *.pem /etc/nginx/certs/ && ls /etc/nginx/certs/  

RUN nginx -t
EXPOSE 80
EXPOSE 443
ENTRYPOINT service php7.3-fpm start && nginx -g 'daemon off;' 
