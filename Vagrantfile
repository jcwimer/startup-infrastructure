Vagrant.configure("2") do |config|

  config.vm.define "bootstrap" do |bootstrap|
    bootstrap.vm.box = "ubuntu/bionic64"
    bootstrap.vm.hostname = "bootstrap"
    bootstrap.vm.network "private_network", ip: "192.168.254.2"
    bootstrap.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
  end


  config.vm.define "worker1" do |worker1|
    worker1.vm.box = "ubuntu/bionic64"
    worker1.vm.hostname = "worker1"
    worker1.vm.network "private_network", ip: "192.168.254.3"
    worker1.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.cpus = 1
    end
  end
end