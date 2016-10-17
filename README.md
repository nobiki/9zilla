# 9zilla
Debian Workspace With PHP, Python, Nginx, Selenium, Behat, Xvfb

#### Caution
this container is development use only. do not use in production environment.

#### Usage
1. default user you must change `Dockerfile`

``` sh
ARG username="my_user"
ARG password="my_pass"
```

2. Then, `docker-compose up`

``` sh
$ docker-compose up -d
```
