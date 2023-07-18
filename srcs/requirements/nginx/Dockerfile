# Welcome to the n-jinks Dockerfile.

FROM debian:bookworm

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install nginx -y

RUN mkdir /tmp/nginx_conf
WORKDIR /tmp/nginx_conf

COPY nginx.conf $WORKDIR

# Run nginx 
CMD [ "nginx", "-c", "/tmp/nginx_conf/nginx.conf", "-g", "daemon off;"]
