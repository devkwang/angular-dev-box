# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "trusty-server-cloudimg-amd64-vagrant-disk1"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"


  # Set ip address
  config.vm.network "private_network", ip: "127.0.0.1"

  # forward default port 80 to host 8080.
  # If changed you must update Gruntfile.js to match
  config.vm.network :forwarded_port, :host => 9000, :guest => 9000

  # forward tests port 81 to host 8081.
  # If changed you must update Gruntfile.js to match
  config.vm.network :forwarded_port, :host => 9001, :guest => 9001

  # forward livereload port 35729 to host 35729.
  # If changed you must update GRuntfile.js to match
  config.vm.network :forwarded_port, :host => 35729, :guest => 35729


  config.vm.provider :virtualbox do |v|
    # Name this virtual machine so it can be easily located.
    v.name = "AngularJs - with puppet, yeoman, bower, node.js, and grunt."

    # Customize memory allocation
    v.customize ["modifyvm", :id, "--memory", "2048"]
    v.customize ["modifyvm", :id, "--cpus", "1"]
  end

  config.vm.provision "puppet" do |puppet|
    puppet.options = "--verbose --debug"
  end

end
