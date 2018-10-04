FROM ubuntu:16.04

ENV LANG=C.UTF-8
ENV WP_ROOT=/var/www/html/wordpress
ENV MYSQL_HOST=localhost
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=warpzone
ENV MYSQL_PASSWORD=warpzone

# Install general package
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install software-properties-common python-software-properties sudo git curl nano wget netcat

# Add repository
RUN add-apt-repository -y ppa:nginx/stable
RUN apt-get update
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update

# Install nginx & php
RUN apt-get install -y nginx mcrypt php7.1 php7.1-cli php7.1-common php7.1-json php7.1-opcache php7.1-mysql php7.1-mbstring php7.1-mcrypt php7.1-zip php7.1-fpm

# Install wordpress
RUN cd /tmp && wget -c http://wordpress.org/latest.tar.gz
RUN tar -xf /tmp/latest.tar.gz --directory /var/www/html
RUN mv $WP_ROOT/wp-config-sample.php $WP_ROOT/wp-config.php

ADD wordpress /etc/nginx/sites-available/wordpress
RUN ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/wordpress

ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 80 9000
ENTRYPOINT [ "/bin/bash" , "/entrypoint.sh"]