FROM debian:jessie
MAINTAINER Naoaki Obiki

RUN apt-get update && apt-get install -y sudo git

#include "./include/useradd.docker"
#include "./include/base.docker"
#include "./include/direnv.docker"

#include "./include/ruby.docker"

#include "./include/nginx.docker"
#include "./include/mariadb-client.docker"


CMD ["/sbin/init"]
