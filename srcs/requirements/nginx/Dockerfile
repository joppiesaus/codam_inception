# Welcome to the n-jinks Dockerfile.

FROM debian:bookworm

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install nginx -y

RUN mkdir /tmp/nginx_conf
WORKDIR /tmp/nginx_conf

# copy da config to the nginx dir
COPY nginx.conf /etc/nginx/sites-enabled/default

# Run nginx 
CMD [ "nginx", "-g", "daemon off;"]
