FROM ubuntu:16.04

ENV LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
ENV TZ=Asia/Jakarta
ENV USER=appuser

# general
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install software-properties-common python-software-properties sudo git curl nano wget net-tools locales zip unzip htop
RUN locale-gen en_US.UTF-8

# set timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y tzdata
RUN dpkg-reconfigure --frontend noninteractive tzdata 

# php
RUN add-apt-repository -y ppa:ondrej/php
RUN apt-get update
RUN apt-get install -y php7.1 php7.1-cli php7.1-common \
    php7.1-dev php7.1-json php7.1-opcache php7.1-mysql \
    php7.1-imap php7.1-soap php7.1-mbstring php7.1-mcrypt \ 
    php7.1-zip php7.1-fpm php7.1-bcmath php7.1-curl \
    php7.1-intl php7.1-iconv php7.1-xmlrpc php7.1-gd php7.1-simplexml

# php configuration
RUN rm -f /etc/php/7.1/fpm/pool.d/www.conf
ADD fpm/pool.d/www.conf /etc/php/7.1/fpm/pool.d/$USER.conf
ADD fpm/php-fpm.conf /etc/php/7.1/fpm/php-fpm.conf
ADD fpm/php.ini /etc/php/7.1/fpm/php.ini

# composer
RUN curl -s https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer

# create docker group and user
RUN useradd -rm -d /home/$USER -s /bin/bash -G sudo -u 1001 $USER
ADD etc/sudoers /etc/sudoers
RUN chown -R $USER:$USER /var/lib/php/

# add entrypoint
ADD entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

USER $USER
WORKDIR /home/$USER

EXPOSE 9000
ENTRYPOINT [ "/bin/bash" , "/opt/entrypoint.sh"]