
init: prepare-os prepare-vagrant prepare-config install-packages-vagrant postprocess-vagrant

##########
prepare-os:
	/bin/bash provision/prepare-os.sh

prepare-vagrant:
	/bin/bash provision/vagrant-create.sh

prepare-config:
	vagrant ssh -c "bash /vagrant/provision/prepare-config.sh"

install-packages-vagrant:
	vagrant ssh -c "sudo bash /vagrant/provision/install-packages-vagrant.sh"

postprocess-vagrant:
	/bin/bash provision/vagrant-postprocess.sh
##########

up:
	vagrant up

stop:
	vagrant halt -f

halt: stop

destroy:
	vagrant destroy -f

reload:
	vagrant reload

bash:
	vagrant ssh

ssh: bash
