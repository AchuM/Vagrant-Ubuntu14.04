# Author: Achu Abebe 
# Email: AchuSime@gmail.com
# -*- mode: ruby -*-
# vi: set ft=ruby :

# Every Vagrant virtual environment requires a box to build off of.
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  config.vm.hostname = "vagrant-Ubuntu18.04"

end
#config.ssh.private_key_path="~/.ssh/id_rsa"
  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'
  config.ssh.forward_agent = true
  # using a specific IP.
  config.vm.network "private_network", ip: "192.168.10.10"

#config.vm.synced_folder ".", "/vagrant", type: "nfs" 
config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
config.vm.provider "virtualbox" do |vb|
  #   # Customize the amount of memory on the VM:
    vb.memory = "1024"
    vb.name = "vagrant_anisible"
  end
  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  config.vm.synced_folder "public", "/var/www/", nfs: true
  config.vm.provision :shell, :path => "bootstrap.sh"


  # Bootstrap Puppet by updating guest packages and installing the required
  # Puppet modules using libraian-puppet
  #
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path    = "puppet/manifests"
    puppet.manifest_file     = "bootstrap.pp"
    puppet.hiera_config_path = "puppet/hiera.yaml"
    # puppet.options = "--verbose --debug"
  end

  # Provision the box according to the main provision manifest
  #
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path    = "puppet/manifests"
    puppet.module_path       = "puppet/modules"
    puppet.manifest_file     = "provision.pp"
    puppet.hiera_config_path = "puppet/hiera.yaml"
    # puppet.options = "--verbose --debug"
  end
end
