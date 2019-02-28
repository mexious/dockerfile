FROM ubuntu:16.04

ENV LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
ENV TZ=Asia/Jakarta
ENV USER=appuser
ENV FQDN=localhost
ENV WEBROOT=/var/www/html
ENV FPM=php

# general
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install software-properties-common python-software-properties sudo git curl nano wget net-tools locales htop
RUN locale-gen en_US.UTF-8

# set timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata 

# nginx
RUN add-apt-repository -y ppa:nginx/stable 
RUN apt-get update 
RUN apt-get install -y nginx
ADD etc/nginx/nginx.conf /etc/nginx/nginx.conf
ADD etc/nginx/sites-enabled/default.conf /etc/nginx/sites-enabled/

# letsencrypt
RUN apt-get install -y letsencrypt

# create docker group and users
RUN useradd -rm -d /home/$USER -s /bin/bash -G sudo -u 1001 $USER
ADD etc/sudoers /etc/sudoers
RUN chown -R $USER:$USER /var/log/nginx /var/lib/nginx $WEBROOT

# add entrypoint
ADD entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

USER $USER
WORKDIR /home/$USER

VOLUME ["/etc/nginx"]

EXPOSE 80 443
ENTRYPOINT [ "/bin/bash", "/opt/entrypoint.sh" ]