#!/bin/bash

sudo -i -u 9zilla bash -c "cd /etc/uwsgi/ && pyenv install 3.5.0"
sudo -i -u 9zilla bash -c "cd /etc/uwsgi/ && pyenv virtualenv 3.5.0 uwsgi"
sudo -i -u 9zilla bash -c "cd /etc/uwsgi/ && pyenv local uwsgi"
sudo -i -u 9zilla bash -c "cd /etc/uwsgi/ && pip install -r packages.txt"

