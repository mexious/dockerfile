FROM ubuntu:16.04

LABEL maintainer="myugan59@gmail.com"
LABEL version="5.7"

ENV MARIADB_NAME=mariadb
ENV MARIADB_USER=mariauser
ENV MARIADB_PASS=mariapass123
ENV MARIADB_ROOT_PASS=root

ENV DEBIAN_FRONTEND=noninteractive

# Install general package
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install software-properties-common python-software-properties sudo git curl nano wget net-tools

# Install mariadb
RUN apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
RUN add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.2/ubuntu xenial main'
RUN apt-get update
RUN apt-get install -y mariadb-server mariadb-client
RUN sed -i 's/^\(bind-address\s.*\)/# \1/' /etc/mysql/my.cnf

ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

VOLUME [ "/var/lib/mysql"]

EXPOSE 3306
ENTRYPOINT [ "/bin/bash" , "/entrypoint.sh"]
