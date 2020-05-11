#!/bin/bash

mkdir -p /root/.ssh

# Putting test_rsa.pub into root and vagrant authorized keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYa9zstumlg7XkKoNrJMlIN/zteqMA9J4GjuZA7r0xfMPrz4CglxzYKd/BhBpwp/HhU+vSR6vBa15kRODHdPZ+T1oXzMXAmMT3R2ZJRqF280Hsx9sK0X+FZWM84e4a1zQUrxuWyWJ4kKIiaX6DBAmhy8zHNvQ0c4Nk1exfwRicojaze71qrexSas4FHWaI4usC/g3mMKfiML/QX0UWW/G+D8qrg3cK3zClG916XlY/p1h9SWantqz75ea33TtmDNW6iCraKSjVeDGfzhshJsmQ7+/Rr/L4/s7hdpwTqdjSlJTIi61eBxcpDfMWBmsHOMZgnsTZ3wrdYXo70k44moA7 vagrant@test" >> /home/vagrant/.ssh/authorized_keys
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYa9zstumlg7XkKoNrJMlIN/zteqMA9J4GjuZA7r0xfMPrz4CglxzYKd/BhBpwp/HhU+vSR6vBa15kRODHdPZ+T1oXzMXAmMT3R2ZJRqF280Hsx9sK0X+FZWM84e4a1zQUrxuWyWJ4kKIiaX6DBAmhy8zHNvQ0c4Nk1exfwRicojaze71qrexSas4FHWaI4usC/g3mMKfiML/QX0UWW/G+D8qrg3cK3zClG916XlY/p1h9SWantqz75ea33TtmDNW6iCraKSjVeDGfzhshJsmQ7+/Rr/L4/s7hdpwTqdjSlJTIi61eBxcpDfMWBmsHOMZgnsTZ3wrdYXo70k44moA7 vagrant@test" >> /root/.ssh/authorized_keys

# Setting A record
# echo "192.168.254.2 mysql-orchestrator.test.com" >> /etc/hosts
# echo "192.168.254.2 kanban.test.com" >> /etc/hosts

cp /vagrant/tests/files/test_rsa /home/vagrant/test_rsa
chmod 600 /home/vagrant/test_rsa
chown vagrant:vagrant /home/vagrant/test_rsa

apt-get update -qq
apt-get install -y -qq lvm2 curl