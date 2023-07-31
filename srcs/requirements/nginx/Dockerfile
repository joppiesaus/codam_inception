# Welcome to the n-jinks Dockerfile.

FROM debian:bookworm

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install nginx openssl -y

RUN mkdir /tmp/nginx_conf
WORKDIR /tmp/nginx_conf

# https://unix.stackexchange.com/a/104305
# https://stackoverflow.com/a/6464435
RUN  openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=NL/ST=Noord Holland/L=Amsterdam/O=Codam/OU=Student/CN=jobvan-d.42.fr/pseudonym=sussy gussy/title=yeet" -keyout jobvan-d.42.fr.key  -out jobvan-d.42.fr.cert

# copy da config to the nginx dir
COPY nginx.conf /etc/nginx/sites-enabled/default

# Run nginx 
CMD ["nginx", "-g", "daemon off;"]
