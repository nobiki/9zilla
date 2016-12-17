# 9zilla
Debian Workspace - Nginx, Selenium, Behat, Xvfb

#### Caution
this container is development use only. do not use in production environment.

#### Usage
* It corresponds to `docker-compose`

``` sh
$ make update
# [docker-compose.yml is customized for your PC]
$ docker-compose up -d
```

* sudo user `Dockerfile`

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

* A file is put here.

server configuration (= volume mount directory): `/var/containers/`  
contents: `/var/virtualdomains/`  
behat feature: `~/ci/behat/features/`  

* When using `anyenv`, it can be used by all containers through `9zilla-volume-anyenv`.

[anyenv - all in one for **env](https://github.com/riywo/anyenv)
