Vagrant.configure("2") do |config|

  config.vm.define "master1" do |bootstrap|
    bootstrap.vm.box = "debian/stretch64"
    bootstrap.vm.hostname = "bootstrap"
    bootstrap.vm.network "private_network", ip: "192.168.254.2"
    bootstrap.vm.provision :shell, path: "tests/files/provision-script.sh"
    bootstrap.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
  end

  config.vm.define "worker1" do |worker1|
    worker1.vm.box = "debian/stretch64"
    worker1.vm.hostname = "worker1"
    worker1.vm.network "private_network", ip: "192.168.254.3"
    worker1.vm.provision :shell, path: "tests/files/provision-script.sh"
    worker1.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 2
    end
  end

  config.vm.define "client" do |client|
    client.vm.box = "debian/stretch64"
    client.vm.hostname = "client"
    client.vm.network "private_network", ip: "192.168.254.4"
    client.vm.provision :shell, path: "tests/files/install-pip.sh"
    client.vm.provision :shell, path: "tests/files/provision-script.sh"
    client.vm.provider "virtualbox" do |v|
      v.memory = 512
      v.cpus = 1
    end
  end
end