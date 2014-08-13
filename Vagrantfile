# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "trusty-server-cloudimg-amd64-vagrant-disk1"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.network "private_network", ip: "10.10.10.2"
  config.vm.network "forwarded_port", guest: 8080, host: 8080, auto_correct: true

  config.vm.provider :virtualbox do |v|
    v.name = "AngularJs - with puppet, node.js, and grunt."
  end


  config.vm.provision "puppet" do |puppet|
    puppet.options = "--verbose --debug"
  end

end
