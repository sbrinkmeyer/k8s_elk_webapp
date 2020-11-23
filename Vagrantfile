# -*- mode: ruby -*-
# vi: set ft=ruby :
#
# WARNING: If you update the private_network IP addresses, you *must*
#          update the corresponding references in ansible

Vagrant.configure("2") do |config|
  # ideally this would be "centos/7", but due to [this issue](https://bugs.centos.org/view.php?id=16408) with
  # the CentOS release process, if you happen to attempt launching an instance during a CentOS release, you
  # could end up getting an error like the following, indiciating the release is in flight and you'll either
  # have to wait for the existing artifacts to be released to the vault or use this generic source:
  #   http://vault.centos.org/7.7.1908/os/x86_64/repodata/repomd.xml: [Errno 14] HTTP Error 404 - Not Found
  config.vm.box = "ubuntu/xenial64"

  config.vm.synced_folder "./shared", "/vagrant_data"

  config.vm.define "master" do |vm_config|
    vm_config.vm.hostname = "master"
    vm_config.vm.network "private_network", ip: "10.11.12.13"
    # vm_config.vm.provision "shell", path: "initialize.sh"

    vm_config.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus   = 2
    end
  end

  config.vm.define "node1" do |vm_config|
    vm_config.vm.hostname = "node1"
    vm_config.vm.network "private_network", ip: "10.11.12.14"
    # vm_config.vm.provision "shell", path: "initialize.sh"

    vm_config.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus   = 2
    end
  end

  config.vm.define "node2" do |vm_config|
    vm_config.vm.hostname = "node2"
    vm_config.vm.network "private_network", ip: "10.11.12.15"
    # vm_config.vm.provision "shell", path: "initialize.sh"

    vm_config.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus   = 2
    end
  end
  config.vm.define "elk" do |vm_config|
    vm_config.vm.hostname = "elk"
    vm_config.vm.network "private_network", ip: "10.11.12.16"
    # vm_config.vm.provision "shell", path: "initialize.sh"

    vm_config.vm.provider "virtualbox" do |vb|
      vb.memory = "4096"
      vb.cpus   = 2
    end
  end
end