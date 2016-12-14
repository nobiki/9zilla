#!/bin/bash

sudo -i -u 9zilla bash -c "anyenv install pyenv"
sudo -i -u 9zilla bash -c "cd /etc/uwsgi/ && pyenv install 3.5.0"
sudo -i -u 9zilla bash -c "git clone https://github.com/yyuu/pyenv-virtualenv ~/.anyenv/envs/pyenv/plugins/pyenv-virtualenv"
sudo -i -u 9zilla bash -c "cd /etc/uwsgi/ && pyenv virtualenv 3.5.0 uwsgi"
sudo -i -u 9zilla bash -c "cd /etc/uwsgi/ && pyenv local uwsgi"
sudo -i -u 9zilla bash -c "cd /etc/uwsgi/ && pip install -r packages.txt"

