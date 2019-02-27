FROM ubuntu:16.04

ENV LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
ENV TZ=Asia/Jakarta
ENV MARIADB_NAME=db_test 
ENV MARIADB_USER=appuser 
ENV MARIADB_PASS=appuser
ENV MARIADB_ROOT_PASS=root
ENV USER=appuser
ENV DEBIAN_FRONTEND=noninteractive

# general
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install software-properties-common python-software-properties sudo git curl nano wget net-tools locales
RUN locale-gen en_US.UTF-8

# set timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install -y tzdata
RUN dpkg-reconfigure tzdata 

# mariadb
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
RUN add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.2/ubuntu xenial main'
RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client

# create docker group and user
RUN useradd -rm -d /home/$USER -s /bin/bash -G sudo -u 1001 $USER
ADD etc/sudoers /etc/sudoers
ADD etc/mysql/my.cnf /etc/mysql/my.cnf

# add entrypoint
ADD entrypoint.sh /opt/entrypoint.sh
RUN chmod +x /opt/entrypoint.sh

USER $USER
WORKDIR /home/$USER

EXPOSE 3306
ENTRYPOINT [ "/bin/bash" , "/opt/entrypoint.sh"]