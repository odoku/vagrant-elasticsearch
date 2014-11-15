# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.network :public_network
  config.vm.network "forwarded_port", guest: 9200, host: 9200
  config.ssh.forward_agent = true
  config.vm.provision :shell, :path => "bootstrap.sh"

  config.vm.provider :virtualbox do |vb|
    vb.name = "Elasticsearch"
    vb.customize ["modifyvm", :id, "--memory", 1024]
  end
end
