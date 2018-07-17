#
# Nginx Dockerfile
# 

FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y software-properties-common python-software-properties && \
    add-apt-repository -y ppa:nginx/stable && \
    apt-get update && \
    apt-get install -y nginx && \
    echo "daemon off;" >> /etc/nginx/nginx.conf

WORKDIR /etc/nginx

EXPOSE 80

CMD ["nginx"]
