#!/bin/bash

chown 1000:1000 /home/9zilla/.anyenv/envs/

sudo -i -u "#1000" bash -c "anyenv install phpenv"
sudo -i -u "#1000" bash -c "cp /default_configure_options /home/9zilla/.anyenv/envs/phpenv/plugins/php-build/share/php-build/"

sudo -i -u "#1000" bash -c "phpenv install 7.2.0RC1"

sudo -i -u "#1000" bash -c "mv /home/9zilla/.anyenv/envs/phpenv/versions/7.2.0RC1/etc/php-fpm.conf.default /home/9zilla/.anyenv/envs/phpenv/versions/7.2.0RC1/etc/php-fpm.conf"
sudo -i -u "#1000" bash -c "ln -s /etc/php-fpm/php-fpm.d/virtualdomains.conf /home/9zilla/.anyenv/envs/phpenv/versions/7.2.0RC1/etc/php-fpm.d/virtualdomains.conf"
