#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

PROJECT_LOCATION_ROOT_DIR_NAME="$( dirname "$( pwd )" )"

source helper/functions.sh

showTitle "Configure SSH"
cp "$PROJECT_LOCATION_ROOT_DIR_NAME/provision/ssh_config/id_rsa" ~/.ssh/id_rsa
cp "$PROJECT_LOCATION_ROOT_DIR_NAME/provision/ssh_config/id_rsa.pub" ~/.ssh/id_rsa.pub
cp "$PROJECT_LOCATION_ROOT_DIR_NAME/provision/config/ssh/config" ~/.ssh/config

showTitle "Configure Composer"
if [ ! -d "~/.composer" ]; then
  mkdir ~/.composer
fi

if [ ! -d "~/.config" ]; then
  mkdir ~/.config
fi

if [ ! -d "~/.config/composer" ]; then
  mkdir ~/.config/composer
fi

cp "$PROJECT_LOCATION_ROOT_DIR_NAME/provision/config/composer/auth.json" ~/.composer/auth.json
cp "$PROJECT_LOCATION_ROOT_DIR_NAME/provision/config/composer/config.json" ~/.composer/config.json
cp "$PROJECT_LOCATION_ROOT_DIR_NAME/provision/config/composer/auth.json" ~/.config/composer/auth.json
cp "$PROJECT_LOCATION_ROOT_DIR_NAME/provision/config/composer/config.json" ~/.config/composer/config.json

showTitle "Successfully finished !"
