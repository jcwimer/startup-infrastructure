machines = {
  'client'    => { :ip =>'192.168.254.4', :memory => '512', :cpus => 1, :client => true},
  'master1'    => { :ip => '192.168.254.2', :memory => '1536', :cpus => 2 },
  'worker1'    => { :ip => '192.168.254.3', :memory => '1536', :cpus => 2 },
  'worker2'    => { :ip => '192.168.254.5', :memory => '1536', :cpus => 2 },
  'worker3'    => { :ip => '192.168.254.6', :memory => '1536', :cpus => 2 },
  # 'worker4'    => { :ip => '192.168.254.7', :memory => '1536', :cpus => 1 },
}


Vagrant.configure("2") do |config|
  machines.each do | hostname, attrs|
    config.vm.define hostname do |machine|
      machine.vm.hostname = hostname
      machine.vm.box = "debian/stretch64"
      machine.vm.network :private_network, :ip => attrs[:ip], netmask: "255.255.255.0"
      machine.vm.provider "virtualbox" do |v|
        v.memory = attrs[:memory]
        v.cpus = attrs[:cpus]
      end
      machine.vm.provision :shell, path: "tests/files/provision-script.sh"
      if attrs[:client] == true
        machine.vm.provision :shell, path: "tests/files/install-pip.sh"
      end
    end
  end
end