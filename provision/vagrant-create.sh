#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

PROJECT_LOCATION_FULL="$( dirname "$( pwd )" )"

source helper/functions.sh

#for bash_file in ../config/local/*.sh; do
#  source "$bash_file";
#done

showTitle "Creating Vagrant"

showSuccess "Prepare SSH"

if [ ! -d "ssh_config" ]; then
  mkdir ssh_config
fi

cp ~/.ssh/id_rsa "$PROJECT_LOCATION_FULL/provision/ssh_config/id_rsa"
cp ~/.ssh/id_rsa.pub "$PROJECT_LOCATION_FULL/provision/ssh_config/id_rsa.pub"

showSuccess "Prepare Vagrantfile"

cp "$PROJECT_LOCATION_FULL/provision/config/vagrant/Vagrantfile_default" "$PROJECT_LOCATION_FULL/Vagrantfile"

cd ../

showTitle "Vagrant UP"

vagrant up --provision

