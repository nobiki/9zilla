# 9zilla
Debian Workspace

> Caution: this container is development use only. do not use in production environment.

#### Usage
It corresponds to `docker-compose`

``` sh
$ make update

# [docker-compose.yml is customized for your PC]
$ docker-compose up -d
```

> There is a sample of `docker-compose.yml` at my gist. - [9zilla-docker-compose.yml](https://gist.github.com/nobiki/24ecf417fe4292edf01698b5f3642edd)
> This docker-compose.yml is created on the assumption that [Barge](https://github.com/bargees/barge-os) is used for the host.
> For other docker hosts please refer to examples.

sudo user `Dockerfile`

``` sh
ARG username="9zilla"
ARG password="9zilla"
```

run `Xvfb` on `DISPLAY=:99`

``` sh
$ selenium-xvfb
```

run `selenium` With chromedriver on `DISPLAY=:99`

``` sh
$ selenium 1>/dev/null 2>/dev/null &
```

A file is put here.

* server configuration (= volume mount directory): `/var/containers/`
* contents: `/var/virtualdomains/` and `/var/workspace/`

When using `anyenv`, it can be used by all containers through `9zilla-volume-anyenv`.

[anyenv](https://github.com/riywo/anyenv)

#### Related projects

* [For Web Developer](https://github.com/nobiki?utf8=%E2%9C%93&tab=repositories&q=9zilla-nginx&type=&language=)
* [Local Repository](https://github.com/nobiki?utf8=%E2%9C%93&tab=repositories&q=9zilla-repos&type=&language=)
