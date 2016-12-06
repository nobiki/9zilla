version: "2"

services:

	##
    # Debian Workspace
	##
    9zilla:
        container_name: 9zilla
        hostname: 9zilla
        image: nobiki/9zilla:latest
        networks:
            b0:
                ipv4_address: 172.18.0.100
        ports:
            -  "80:80"
            -  "443:443"
            -  "19022:22"
        environment:
            - "TZ=Asia/Tokyo"
        volumes:
            - /var/containers/9zilla/etc/nginx/conf.d/:/etc/nginx/conf.d/
            - /var/containers/9zilla/usr/local/lib/behat/features/:/usr/local/lib/behat/features/
        ### example - Docker for Mac
        #     - /private/var/containers/9zilla/etc/nginx/conf.d/:/etc/nginx/conf.d/
        #     - /private/var/containers/9zilla/usr/local/lib/behat/features/:/usr/local/lib/behat/features/
        ### example - Docker for Windows
        #     - C:\containers\9zilla\etc\nginx\conf.d\:/etc/nginx/conf.d/
        #     - C:\containers\9zilla\usr\local\lib\behat\features\:/usr/local/lib/behat/features/
        ### example - boot2docker
        #     - /var/lib/boot2docker/containers/9zilla/etc/nginx/conf.d/:/etc/nginx/conf.d/
        #     - /var/lib/boot2docker/containers/9zilla/usr/local/lib/behat/features/:/usr/local/lib/behat/features/
        volumes_from:
            - 9zilla-volume-anyenv
            - 9zilla-volume-contents
        privileged: true
        command: /sbin/init

	##
    # Data Volume (.90)
	##
    9zilla-volume-anyenv:
        container_name: 9zilla-volume-anyenv
        hostname: 9zilla-volume-anyenv
		image: nobiki/9zilla-volume-anyenv:latest
        networks:
            b0:
                ipv4_address: 172.18.0.90
        environment:
            - "TZ=Asia/Tokyo"
        volumes:
            - /var/containers/9zilla-volume-anyenv/home/9zilla/.anyenv/envs/:/home/9zilla/.anyenv/envs/
        ### example - Docker for Mac
        #   - /private/var/containers/9zilla-volume-anyenv/home/9zilla/.anyenv/envs/:/home/9zilla/.anyenv/envs/
        ### example - Docker for Windows
        #   - C:\containers\9zilla-volume-anyenv\home\9zilla\.anyenv\envs\:/home/9zilla/.anyenv/envs/
        ### example - boot2docker
        #   - /var/lib/boot2docker/containers/9zilla-volume-anyenv/home/9zilla/.anyenv/envs/:/home/9zilla/.anyenv/envs/
		command: /bin/chown -R 1000:1000 /home/9zilla/.anyenv/envs/

    9zilla-volume-contents:
        container_name: 9zilla-volume-contents
        hostname: 9zilla-volume-contents
        image: busybox
        networks:
            b0:
                ipv4_address: 172.18.0.91
        environment:
            - "TZ=Asia/Tokyo"
        volumes:
            - /var/containers/9zilla-volume-contents/virtualdomains/:/var/virtualdomains/
            - /var/containers/9zilla-volume-contents/var/jenkins_home/:/var/jenkins_home/
            - /var/containers/9zilla-volume-contents/etc/pki/tls/certs/:/etc/pki/tls/certs/
        ### example - Docker for Mac
        #     - /private/var/containers/9zilla-volume-contents/virtualdomains/:/var/virtualdomains/
        #     - /private/var/containers/9zilla-volume-contents/var/jenkins_home/:/var/jenkins_home/
        #     - /private/var/containers/9zilla-volume-contents/etc/pki/tls/certs/:/etc/pki/tls/certs/
        ### example - Docker for Windows
        #     - C:\containers\9zilla-volume-contents\virtualdomains\:/var/virtualdomains/
        #     - C:\containers\9zilla-volume-contents\var\jenkins_home\:/var/jenkins_home/
        #     - C:\containers\9zilla-volume-contents\etc\pki\tls\certs\:/etc/pki/tls/certs/
        ### example - boot2docker
        #     - /var/lib/boot2docker/containers/9zilla-volume-contents/virtualdomains/:/var/virtualdomains/
        #     - /var/lib/boot2docker/containers/9zilla-volume-contents/var/jenkins_home/:/var/jenkins_home/
        #     - /var/lib/boot2docker/containers/9zilla-volume-contents/etc/pki/tls/certs/:/etc/pki/tls/certs/

    9zilla-volume-database:
        container_name: 9zilla-volume-database
        hostname: 9zilla-volume-database
        image: busybox
        networks:
            b0:
                ipv4_address: 172.18.0.92
        environment:
            - "TZ=Asia/Tokyo"
        volumes:
            - /var/containers/9zilla-volume-database/var/lib/mysql/:/var/lib/mysql/
            - /var/containers/9zilla-volume-database/data/:/data/
        ### example - Docker for Mac
        #     - /private/var/containers/9zilla-volume-database/var/lib/mysql/:/var/lib/mysql/
        #     - /private/var/containers/9zilla-volume-database/data/:/data/
        ### example - Docker for Windows
        #     - C:\containers\9zilla-volume-database\var\lib\mysql\:/var/lib/mysql/
        #     - C:\containers\9zilla-volume-database\data\:/data/
        ### example - boot2docker
        #     - /var/lib/boot2docker/containers/9zilla-volume-database/var/lib/mysql/:/var/lib/mysql/
        #     - /var/lib/boot2docker/containers/9zilla-volume-database/data/:/data/

	##
    # Web Server (.10)
	##
    9zilla-lamp:
        container_name: 9zilla-lamp
        hostname: 9zilla-lamp
        image: nobiki/9zilla-lamp:latest
        networks:
            b0:
                ipv4_address: 172.18.0.10
        environment:
            - "TZ=Asia/Tokyo"
        volumes:
            - /var/containers/9zilla-lamp/etc/apache2/sites-available/:/etc/apache2/sites-available/
        ### example - Docker for Mac
        #   - /private/var/containers/9zilla-lamp/etc/apache2/sites-available/:/etc/apache2/sites-available/
        ### example - Docker for Windows
        #   - C:\containers\9zilla-lamp\etc\apache2\sites-available\:/etc/apache2/sites-available/
        ### example - boot2docker
        #   - /var/lib/boot2docker/containers/9zilla-lamp/etc/apache2/sites-available/:/etc/apache2/sites-available/
        volumes_from:
            - 9zilla-volume-anyenv
            - 9zilla-volume-contents
        privileged: true
        command: /sbin/init

    9zilla-nginx-ruby:
        container_name: 9zilla-nginx-ruby
        hostname: 9zilla-nginx-ruby
        image: nobiki/9zilla-nginx-ruby:latest
        networks:
            b0:
                ipv4_address: 172.18.0.11
        environment:
            - "TZ=Asia/Tokyo"
        volumes:
            - /var/containers/9zilla-nginx-ruby/etc/nginx/conf.d/:/etc/nginx/conf.d/
        ### example - Docker for Mac
        #   - /private/var/containers/9zilla-nginx-ruby/etc/nginx/conf.d/:/etc/nginx/conf.d/
        ### example - Docker for Windows
        #   - C:\containers\9zilla-nginx-ruby\etc\nginx\conf.d\:/etc/nginx/conf.d/
        ### example - boot2docker
        #   - /var/lib/boot2docker/containers/9zilla-nginx-ruby/etc/nginx/conf.d/:/etc/nginx/conf.d/
        volumes_from:
            - 9zilla-volume-anyenv
            - 9zilla-volume-contents
        privileged: true
        command: /sbin/init

    9zilla-nginx-python:
        container_name: 9zilla-nginx-python
        hostname: 9zilla-nginx-python
        image: nobiki/9zilla-nginx-python:latest
        networks:
            b0:
                ipv4_address: 172.18.0.12
        environment:
            - "TZ=Asia/Tokyo"
        volumes:
            - /var/containers/9zilla-nginx-python/etc/nginx/conf.d/:/etc/nginx/conf.d/
            - /var/containers/9zilla-nginx-python/etc/uwsgi/vassals/:/etc/uwsgi/vassals/
        ### example - Docker for Mac
        #   - /private/var/containers/9zilla-nginx-python/etc/nginx/conf.d/:/etc/nginx/conf.d/
        #   - /private/var/containers/9zilla-nginx-python/etc/uwsgi/vassals/:/etc/uwsgi/vassals/
        ### example - Docker for Windows
        #   - C:\containers\9zilla-nginx-python\etc\nginx\conf.d\:/etc/nginx/conf.d/
        #   - C:\containers\9zilla-nginx-python\etc\uwsgi\vassals\:/etc/uwsgi/vassals/
        ### example - boot2docker
        #   - /var/lib/boot2docker/containers/9zilla-nginx-python/etc/nginx/conf.d/:/etc/nginx/conf.d/
        #   - /var/lib/boot2docker/containers/9zilla-nginx-python/etc/uwsgi/vassals/:/etc/uwsgi/vassals/
        volumes_from:
            - 9zilla-volume-anyenv
            - 9zilla-volume-contents
        privileged: true
        command: /sbin/init

	##
    # Database (.30)
	##
    my-gandamu:
        container_name: my-gandamu
        hostname: my-gandamu
        image: mysql:5.6
        networks:
            b0:
                ipv4_address: 172.18.0.30
        environment:
            - "TZ=Asia/Tokyo"
            - "MYSQL_ROOT_PASSWORD=root"
        volumes:
            - /var/containers/my-gandamu/docker-entrypoint-initdb.d/:/docker-entrypoint-initdb.d
            - /var/containers/my-gandamu/etc/mysql/conf.d/:/etc/mysql/conf.d/
        ### example - Docker for Mac
        #     - /private/var/containers/my-gandamu/docker-entrypoint-initdb.d/:/docker-entrypoint-initdb.d
        #     - /private/var/containers/my-gandamu/etc/mysql/conf.d/:/etc/mysql/conf.d/
        ### example - Docker for Windows
        #     - C:\containers\my-gandamu\docker-entrypoint-initdb.d\:/docker-entrypoint-initdb.d
        #     - C:\containers\my-gandamu\etc\mysql\conf.d\:/etc/mysql/conf.d/
        ### example - boot2docker
        #     - /var/lib/boot2docker/containers/my-gandamu/docker-entrypoint-initdb.d/:/docker-entrypoint-initdb.d
        #     - /var/lib/boot2docker/containers/my-gandamu/etc/mysql/conf.d/:/etc/mysql/conf.d/
        volumes_from:
            - 9zilla-volume-database

    redis-gandamu:
        container_name: redis-gandamu
        hostname: redis-gandamu
        image: redis:3.2.5
        networks:
            b0:
                ipv4_address: 172.18.0.31
        environment:
            - "TZ=Asia/Tokyo"
        volumes_from:
            - 9zilla-volume-database

	##
    # CI (.50)
	##
    ci-gandamu:
        container_name: ci-gandamu
        hostname: ci-gandamu
        image: jenkins:2.19.2
        ports:
            -  "19088:8080"
            -  "19050:50000"
        networks:
            b0:
                ipv4_address: 172.18.0.50
        environment:
            - "TZ=Asia/Tokyo"
        #   - "JAVA_OPTS=-Dhudson.footerURL=http://example.com"
        volumes:
            - /var/run/docker.sock:/var/run/docker.sock
            - /usr/local/bin/docker:/usr/bin/docker
        volumes_from:
            - 9zilla-volume-contents

networks:
    b0:
        driver: bridge
        ipam:
            driver: default
            config:
                -  subnet: 172.18.0.0/16
                   gateway: 172.18.0.1

