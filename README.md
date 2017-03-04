## Purge

If you choose to archive packages as part of your build, over time you can be
left with useless files. With the `purge` command, you can delete these files.

``` sh
php bin/satis purge <configuration-file> <output-dir>
```

 > Note: don't do this unless you are certain your projects no longer reference
    any of these archives in their `composer.lock` files.


# 9zilla
Debian Workspace - Nginx, Selenium, Behat, Xvfb

> Caution: this container is development use only. do not use in production environment.

#### Usage
It corresponds to `docker-compose`

``` sh
$ make update
# [docker-compose.yml is customized for your PC]
$ docker-compose up -d
```

> There is a sample of `docker-compose.yml` at my [gist](https://gist.github.com/nobiki/24ecf417fe4292edf01698b5f3642edd).

sudo user `Dockerfile`

``` sh
ARG username="9zilla"
ARG password="9zilla"
```

Install `behat`

``` sh
$ cd ~/ci/behat/
$ composer.phar install
```

run `Xvfb` on `DISPLAY=:99`

``` sh
$ selenium-xvfb
```

run `selenium` With chromedriver on `DISPLAY=:99`

``` sh
$ selenium &
```

A file is put here.

* server configuration (= volume mount directory): `/var/containers/`  
* contents: `/var/virtualdomains/`  
* behat feature: `~/ci/behat/features/`  

When using `anyenv`, it can be used by all containers through `9zilla-volume-anyenv`.

[anyenv - all in one for **env](https://github.com/riywo/anyenv)
