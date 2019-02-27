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
RUN apt-get install -y php7.2 php7.2-cli php7.2-common \
    php7.2-dev php7.2-json php7.2-opcache php7.2-mysql \
    php7.2-imap php7.2-soap php7.2-mbstring php7.2-zip \
    php7.2-fpm php7.2-bcmath php7.2-curl php7.2-intl \
    php7.2-iconv php7.2-xmlrpc php7.2-gd php7.2-simplexml

# php configuration
RUN rm -f /etc/php/7.2/fpm/pool.d/www.conf
ADD fpm/pool.d/www.conf /etc/php/7.2/fpm/pool.d/$USER.conf
ADD fpm/php-fpm.conf /etc/php/7.2/fpm/php-fpm.conf
ADD fpm/php.ini /etc/php/7.2/fpm/php.ini

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