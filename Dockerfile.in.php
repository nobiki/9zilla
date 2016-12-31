FROM debian:jessie
MAINTAINER Naoaki Obiki

RUN apt-get update && apt-get install -y sudo git

#include "./include/useradd.docker"
#include "./include/base.docker"
#include "./include/direnv.docker"

#include "./include/php.docker"
#include "./include/php-fpm.docker"

#include "./include/nginx.docker"
#include "./include/mariadb-client.docker"

COPY bootstrap.sh /
RUN chmod +x /bootstrap.sh

CMD ["/bootstrap.sh"]