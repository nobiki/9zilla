# 9zilla
Debian Workspace With PHP, Python, NodeJS, Nginx, Selenium, Behat, Xvfb

#### Caution
this container is development use only. do not use in production environment.

#### Usage
* default user you must change `Dockerfile`

``` sh
ARG username="my_user"
ARG password="my_pass"
```

* Then, `docker-compose up`

``` sh
$ docker-compose up -d
```
