#!/usr/bin/env ruby

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-20.04"

  # config.vm.network "forwarded_port", guest: 9000, host: 9009, host_ip: "127.0.0.1"
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  config.vm.network "private_network", ip: "192.168.56.2"

  config.vm.synced_folder ".", "/vagrant", type: "nfs", linux__nfs_options: ['no_root_squash'], map_uid: 0, map_gid: 0

  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.name = 'smile_ubuntu'
    vb.memory = "8192"
  end
  
end
