FROM ubuntu:16.04

ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8

LABEL maintainer="myugan59@gmail.com"
WORKDIR /ansible-role/

# Install general package
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install software-properties-common python-software-properties sudo git curl nano wget netcat 

RUN mkdir -p /ansible-role/

# Install pip
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py

# Install required module
RUN pip install paramiko PyYAML jinja2 'dopy>=0.3.5,<=0.3.5' docker-py

# Install ansible
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt-get update
RUN apt-get install -y ansible

RUN echo '[local]\nlocalhost\n' > /etc/ansible/hosts