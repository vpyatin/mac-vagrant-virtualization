# MAC lxc virtualization

### This project for creating a Smile virtualization for LXC inside MAC OS using Vagrant

### Pre-requirements
run `brew cask install vagrant`

run `vagrant plugin install vagrant-vbguest`

### In case of Vagrant ruby error (during nfs mounting) run the following  command:
```bash
sudo curl -o /opt/vagrant/embedded/gems/2.2.19/gems/vagrant-2.2.19/plugins/hosts/darwin/cap/path.rb https://raw.githubusercontent.com/hashicorp/vagrant/42db2569e32a69e604634462b633bb14ca20709a/plugins/hosts/darwin/cap/path.rb 
```

1) Run `./init.sh`
2) Folder `project` is for you projects to be run on LXC

## For all question contact:
[<vipya@smile.fr>](mailto:vipya@smile.fr) Vitaliy Pyatin
