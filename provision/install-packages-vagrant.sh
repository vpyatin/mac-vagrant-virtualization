#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

PROJECT_LOCATION_ROOT_DIR_NAME="$( dirname "$( pwd )" )"

source helper/functions.sh

# Locales
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"

showTitle "Install needed packages"

showTitle "Install NFS"
apt install -y nfs-kernel-server nfs-common > /dev/null
add-apt-repository ppa:ondrej/php -y > /dev/null
apt-get update > /dev/null

showTitle "Install PHP 7.4"

apt-get install --no-install-recommends --no-install-suggests -q -y \
            apt-utils \
            curl \
            git \
            unzip \
            nano \
            net-tools \
            python3-pip \
            python-setuptools \
            php7.4 \
            php7.4-fpm \
            php7.4-cli \
            php7.4-dev \
            php7.4-common \
            php7.4-json \
            php7.4-opcache \
            php7.4-readline \
            php7.4-mbstring \
            php7.4-curl \
            php7.4-memcached \
            php7.4-imagick \
            php7.4-mysql \
            php7.4-pgsql \
            php7.4-intl \
            php7.4-xml \
            php7.4-bcmath \
            php7.4-gd \
            php7.4-soap \
            php7.4-zip \
            php7.4-redis \
            > /dev/null

update-alternatives --set php /usr/bin/php7.4

sudo -u $USER curl -sS https://getcomposer.org/installer | sudo -u $USER php -- --install-dir=/usr/local/bin --filename=composer

showTitle "Configure SSH"
sudo -u $USER cp "$PROJECT_LOCATION_ROOT_DIR_NAME/provision/ssh_config/id_rsa" ~/.ssh/id_rsa
sudo -u $USER cp "$PROJECT_LOCATION_ROOT_DIR_NAME/provision/ssh_config/id_rsa.pub" ~/.ssh/id_rsa.pub

showTitle "Configure Composer"
if [ ! -d "~/.composer" ]; then
  sudo -u $USER mkdir ~/.composer
fi

if [ ! -d "~/.config" ]; then
  sudo -u $USER mkdir ~/.config
fi

if [ ! -d "~/.config/composer" ]; then
  sudo -u $USER mkdir ~/.config/composer
fi

sudo -u $USER cp "$PROJECT_LOCATION_ROOT_DIR_NAME/provision/config/composer/auth.json" ~/.composer/auth.json
sudo -u $USER cp "$PROJECT_LOCATION_ROOT_DIR_NAME/provision/config/composer/config.json" ~/.composer/config.json
sudo -u $USER cp "$PROJECT_LOCATION_ROOT_DIR_NAME/provision/config/composer/auth.json" ~/.config/composer/auth.json
sudo -u $USER cp "$PROJECT_LOCATION_ROOT_DIR_NAME/provision/config/composer/config.json" ~/.config/composer/config.json

showTitle "Composer configured"

sudo chown $USER:$USER ~/.ssh/id_rsa* -R
sudo chown $USER:$USER ~/.composer/* -R
sudo chown $USER:$USER ~/.config/composer/* -R

showTitle "Successfuly finished !"
