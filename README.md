# 9zilla
Debian Workspace - PHP, Python, NodeJS, Nginx, Selenium, Behat, Xvfb

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

* run `Xvfb` on `DISPLAY=:99`

``` sh
$ selenium-xvfb
```

* run `selenium` With chromedriver on `DISPLAY=:99`

``` sh
$ selenium &
```

* Initialization of MySQL settings.

``` sh
$ sudo cp -r 9zilla/settings/my-gandamu /var/containers/
```
