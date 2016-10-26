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
* Install `behat`

``` sh
$ cd ~/ci/behat/
$ composer.phar install
```

* run `Xvfb`

``` sh
$ selenium-xvfb
```

* run `selenium` With chromedriver

``` sh
$ selenium &
```
