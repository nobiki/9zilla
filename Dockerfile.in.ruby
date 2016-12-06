FROM debian:jessie
MAINTAINER Naoaki Obiki

ARG username="9zilla"
ARG password="9zilla"

RUN apt-get update

#include "./include/plain.docker"

#include "./include/xvfb.docker"
#include "./include/browser.docker"
#include "./include/selenium-behat.docker"

#include "./include/nginx.docker"

#include "./include/ruby.docker"

#include "./include/node.docker"
#include "./include/mariadb-client.docker"
