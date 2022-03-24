#!/usr/bin/env bash

U=`id -u`
G=`id -g`

cd "$( dirname "${BASH_SOURCE[0]}" )"

source helper/functions.sh

showTitle "Initialization"

is_ssh_exist

showSuccess "Create project folder"
if [ ! -d "projects" ]; then
  mkdir projects
fi

showTitle "NFS (sudo password might be required)"
showSuccess "Starting NFSD"
sudo nfsd start

###
### Check in case of error during mounting NFS
###
#showSuccess "Setting up"
#FILE=/etc/exports
#
#showSuccess "Editing file [$FILE]..."
#
#LINE="/Users -alldirs -mapall=$U:$G 192.168.56.1"
#grep -qF -- "$LINE" "$FILE" || sudo echo "$LINE" | sudo tee -a $FILE > /dev/null
#
#LINE="/Users -alldirs -mapall=$U:$G localhost"
#grep -qF -- "$LINE" "$FILE" || sudo echo "$LINE" | sudo tee -a $FILE > /dev/null
#
#showSuccess "Restarting NFS (sudo password might be required)"
#sudo nfsd restart

