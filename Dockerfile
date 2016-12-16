FROM debian:jessie
MAINTAINER Naoaki Obiki
RUN apt-get update && apt-get install -y sudo git
ARG username="9zilla"
ARG password="9zilla"
RUN mkdir /home/$username
RUN useradd -s /bin/bash -d /home/$username $username && echo "$username:$password" | chpasswd
RUN echo ${username}' ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers.d/$username
RUN mkdir -p /home/$username/ci
RUN chown -R $username:$username /home/$username
RUN apt-get install -y ssh
RUN sed -ri "s/^UsePAM yes/#UsePAM yes/" /etc/ssh/sshd_config
RUN sed -ri "s/^#UsePAM no/UsePAM no/" /etc/ssh/sshd_config
RUN sed -ri "s/^#PasswordAuthentication yes/PasswordAuthentication yes/" /etc/ssh/sshd_config
RUN systemctl enable ssh
RUN apt-get install -y make gcc g++ vim tig dbus bash-completion supervisor bzip2 unzip tree sed pandoc locales dialog chrony openssl curl wget expect cron dnsutils procps siege htop inetutils-traceroute iftop bmon iptraf nload slurm sl toilet lolcat lsb-release
RUN locale-gen ja_JP.UTF-8 && localedef -f UTF-8 -i ja_JP ja_JP
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:jp
ENV LC_ALL ja_JP.UTF-8
RUN echo "export LANG=ja_JP.UTF-8" >> ~/.bash_profile
RUN echo "export LANGUAGE=ja_JP:jp" >> ~/.bash_profile
RUN echo "export LC_ALL=ja_JP.UTF-8" >> ~/.bash_profile
RUN cp -p /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
RUN sed -ri "s/^server 0.debian.pool.ntp.org/#server 0.debian.pool.ntp.org/" /etc/chrony/chrony.conf
RUN sed -ri "s/^server 1.debian.pool.ntp.org/#server 1.debian.pool.ntp.org/" /etc/chrony/chrony.conf
RUN sed -ri "s/^server 2.debian.pool.ntp.org/#server 2.debian.pool.ntp.org/" /etc/chrony/chrony.conf
RUN sed -ri "s/^server 3.debian.pool.ntp.org/#server 3.debian.pool.ntp.org/" /etc/chrony/chrony.conf
RUN echo "server ntp0.jst.mfeed.ad.jp" >> /etc/chrony/chrony.conf
RUN echo "server ntp1.jst.mfeed.ad.jp" >> /etc/chrony/chrony.conf
RUN echo "server ntp2.jst.mfeed.ad.jp" >> /etc/chrony/chrony.conf
RUN echo "allow 172.18/12" >> /etc/chrony/chrony.conf
RUN systemctl enable chrony
RUN sudo -u $username mkdir -p /home/$username/gitwork/bitbucket/dotfiles/
RUN sudo -u $username git clone "https://nobiki@bitbucket.org/nobiki/dotfiles.git" /home/$username/gitwork/bitbucket/dotfiles/
RUN sudo -u $username cp /etc/bash.bashrc /home/$username/.bashrc
RUN sudo -u $username cp /home/$username/gitwork/bitbucket/dotfiles/.bash_profile /home/$username/.bash_profile
RUN sudo -u $username cp /home/$username/gitwork/bitbucket/dotfiles/.gitconfig /home/$username/.gitconfig
RUN sudo -u $username mkdir -p /home/$username/.ssh/
RUN sudo -u $username cp /home/$username/gitwork/bitbucket/dotfiles/.ssh/config /home/$username/.ssh/config
RUN curl -o /usr/local/bin/hcat "https://raw.githubusercontent.com/nobiki/bash-hcat/master/hcat" && chmod +x /usr/local/bin/hcat
RUN curl -o /usr/local/bin/jq "http://stedolan.github.io/jq/download/linux64/jq" && chmod +x /usr/local/bin/jq
RUN echo 'if [ -e $HOME/.anyenv/bin ]; then' >> /home/$username/.bash_profile
RUN echo '  export PATH="$HOME/.anyenv/bin:$PATH"' >> /home/$username/.bash_profile
RUN echo '  eval "$(anyenv init -)"' >> /home/$username/.bash_profile
RUN echo 'fi' >> /home/$username/.bash_profile
RUN apt-get install -y direnv
RUN echo 'eval "$(direnv hook bash)"' >> /home/$username/.bash_profile
ADD archives/ngrok /usr/local/bin/ && chmod +x /usr/local/bin/ngrok
RUN apt-get install -y xvfb
RUN echo "Xvfb :99 -screen 0 1920x1200x24 > /dev/null &" > /usr/local/bin/selenium-xvfb
RUN chmod +x /usr/local/bin/selenium-xvfb
RUN wget -q -O - "https://dl-ssl.google.com/linux/linux_signing_key.pub" | apt-key add -
RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' >> /etc/apt/sources.list.d/google-chrome.list
RUN apt-get update && apt-get install -y google-chrome-stable firefox-esr
RUN apt-get install -y default-jdk
ADD archives/selenium-server-standalone.jar /usr/local/bin/
RUN echo "DISPLAY=:99 java -jar /usr/local/bin/selenium-server-standalone.jar -Dwebdriver.chrome.driver=/usr/local/lib/selenium/chromedriver" > /usr/local/bin/selenium
RUN chmod +x /usr/local/bin/selenium
RUN mkdir /usr/local/lib/selenium
ADD archives/chromedriver /usr/local/lib/selenium/
RUN mkdir -p /usr/local/lib/behat/
ADD settings/behat/composer.json /usr/local/lib/behat/
ADD settings/behat/behat.yml /usr/local/lib/behat/
RUN chown -R $username:$username /usr/local/lib/behat/
RUN ln -s /usr/local/lib/behat/bin/behat /usr/local/bin/behat
RUN ln -s /usr/local/lib/behat/ /home/$username/ci/behat
RUN apt-get install -y nginx
RUN chmod 755 /var/log/nginx/
RUN systemctl enable nginx
RUN apt-get install -y php5 php5-dev php5-cgi php5-cli php5-curl php5-mongo php5-mysql php5-memcache php5-mcrypt mcrypt php5-readline php5-json php5-imagick imagemagick php5-oauth
RUN systemctl disable apache2
RUN apt-get install -y vim-nox pkg-config libbz2-dev libreadline-dev libsqlite3-dev libssl-dev libfreetype6-dev
RUN apt-get install -y libssl-dev libreadline-dev zlib1g-dev
RUN apt-get install -y mariadb-client libmysqlclient-dev
CMD ["/sbin/init"]
