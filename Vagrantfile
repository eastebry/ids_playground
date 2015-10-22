# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  
  # Call the bootstrap script to provision the box
  config.vm.provision :shell, path: "bootstrap.sh"
  
  # config.vm.network "private_network", type: "dhcp"
  config.vm.network "forwarded_port", guest: 5601, host: 8080 
  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    # Customize the amount of memory on the VM:
    vb.memory = "2048"
    vb.cpus = 2
  end
end
