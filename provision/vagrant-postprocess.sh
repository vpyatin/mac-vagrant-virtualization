#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

PROJECT_LOCATION_FULL="$( dirname "$( pwd )" )"

source helper/functions.sh

#for bash_file in ../config/local/*.sh; do
#  source "$bash_file";
#done

showTitle "Port forwarding for LXC"

sudo route add 10.0.3.0/24 192.168.56.2

cd ../

vagrant halt -f

showTitle "Prepare Vagrantfile for NFS"

rm "$PROJECT_LOCATION_FULL/Vagrantfile"

cp "$PROJECT_LOCATION_FULL/provision/config/vagrant/Vagrantfile_nfs" "$PROJECT_LOCATION_FULL/Vagrantfile"

showTitle "Vagrant Reload"

vagrant reload

