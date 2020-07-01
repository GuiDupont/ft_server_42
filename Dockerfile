FROM debian:buster
RUN apt-get update && apt-get upgrade -y

RUN apt-get install nginx -y
RUN apt-get install mariadb-server -y
RUN apt-get install php php-fpm -y

RUN apt-get install wget -y && apt-get install tar -y
RUN wget https://wordpress.org/latest.tar.gz
RUN tar xf latest.tar.gz && mv wordpress /var/www/html/wordpress

RUN rm -rf /etc/nginx/sites-enabled/*
COPY srcs/config.nginx /etc/nginx/sites-available/config
RUN ln -s /etc/nginx/sites-available/config /etc/nginx/sites-enabled/config
RUN nginx -t
EXPOSE 80
ENTRYPOINT nginx -g 'daemon off;'

