FROM debian:stable

LABEL maintainer="myugan59@gmail.com"
LABEL version="6.4.2"

ENV PATH="$PATH:/usr/share/elasticsearch/bin/"

# Install general package
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install software-properties-common apt-transport-https sudo git nano curl wget net-tools

# Install java
RUN apt install -y default-jdk default-jre
RUN curl -L -b "oraclelicense=a" -O http://download.oracle.com/otn-pub/java/jdk/8u181-b13/96a7b8442fe848ef90c96a2fad6ed6d1/jdk-8u181-linux-x64.tar.gz
RUN mkdir /usr/local/oracle-java-8
RUN tar -zxf jdk-8u181-linux-x64.tar.gz -C /usr/local/oracle-java-8
RUN update-alternatives --install "/usr/bin/java" "java" "/usr/local/oracle-java-8/jdk1.8.0_181/bin/java" 1500
RUN update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/oracle-java-8/jdk1.8.0_181/bin/javac" 1500
RUN update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/oracle-java-8/jdk1.8.0_181/bin/javaws" 1500

# Install elasticsearch
RUN echo "deb https://artifacts.elastic.co/packages/6.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-6.x.list
RUN apt-get update
RUN apt-get install -y --allow-unauthenticated elasticsearch

ADD elasticsearch.yml /etc/elasticsearch/elasticsearch.yml

ADD ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 9200 9300
ENTRYPOINT [ "/bin/bash" , "/entrypoint.sh"]