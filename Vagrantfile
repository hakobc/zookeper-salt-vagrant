# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

# Require a recent version of vagrant otherwise some have reported errors setting host names on boxes
Vagrant.require_version ">= 1.6.3"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # The number of minions to provision
  num_minion = (ENV['NUM_MINIONS'] || 0).to_i

  # ip configuration
  master_ip = "10.245.1.2"
  minion_ip_base = "10.245.2."

  config.vm.box = "ubuntu/trusty64"

  config.vm.provider :virtualbox do |v|
    # On VirtualBox, we don't have guest additions or a functional vboxsf
    # in CoreOS, so tell Vagrant that so it can be smarter.
    v.check_guest_additions = false
    v.functional_vboxsf     = false
    v.memory = 1536
    v.cpus = 1
  end

  config.vm.define "master" do |config|
    config.vm.network "private_network", ip: master_ip
    config.vm.hostname = "salt-master"
    config.vm.synced_folder "salt", "/srv/salt"
    config.vm.provision "shell", inline: "sudo chmod +x /srv/salt/script/provision-minion.sh && sudo /srv/salt/script/provision-minion.sh"
    #config.vm.synced_folder "kafka", "/srv/salt/kafka"
    #config.vm.synced_folder "vagrant/zookeeper/zookeeper", "/srv/salt/zookeeper"
    #config.vm.synced_folder "vagrant/srv/pillar", "/srv/pillar"
  end


end
