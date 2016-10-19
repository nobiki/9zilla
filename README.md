# 9zilla
Debian Workspace With PHP, Python, NodeJS, Nginx, Selenium, Behat, Xvfb

#### Caution
this container is development use only. do not use in production environment.

#### Usage
* It corresponds to `docker-compose`

``` sh
$ docker-compose up -d
```

* When it's necessary, a build is done after the default user is changed. `Dockerfile`

``` sh
ARG username="9zilla"
ARG password="9zilla"
```

