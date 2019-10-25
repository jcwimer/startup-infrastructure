# startup-infrastructure

This is an Ansible playbook that configures a Kubernetes cluster and deploys a full set of self hosted tools for a new company. After you point a wildcard A record to the cluster, you will be able to access the following tools. The goal of this project is to create a one stop shop for self hosting your infrastructure.

### Services
1. Kanban board - Using [Wekan](https://wekan.github.io/). This is connected to Mongo DB and will be accessable at http://kanban.root_domain
2. Mysql cluster - Using [Presslabs Mysql Operator](https://www.presslabs.com/docs/mysql-operator/getting-started/)
3. MongoDB cluster

# Deploy

### Requirements for deployment machine (for the machine you're executing the deploy from)
1. Python
2. Pip
3. Pipenv
4. Docker
5. SSH access to all nodes you're deploying to. 

### Requirements for infrastructure (the machines you're deploying to)
1. Ubuntu
2. Internet access

### Steps
1. Copy `hosts.example` to `hosts`
    * Put ip addresses under the sections
    * Masters are nodes used for managing a kubernetes cluster. It is recommended to has 3 or 5 masters.
    * Workers are nodes used for running containers. You can have as many as necessary.
 2. Copy group_vars/all.example to group_vars/all
    * This is where a lot of configuration comes in. Please see our documentation.
 3. Run `bash supporting-scripts/deploy.sh`

# Lab environment

You can easily run a lab environment with Vagrant. 

### Requirements
1. Install [Virtualbox](https://www.virtualbox.org/)
2. Install [Vagrant](https://www.vagrantup.com/)
3. Run `vagrant up`
4. Run `vagrant ssh client -c 'bash /vagrant/tests/files/run-test-deploy.sh'`
5. Put the following in your `/etc/hosts` file: 
```
192.168.254.2    kanban.test.com
192.168.254.2    mysql-orchestrator.test.com
```
6. Now navigate to any of the services at http://servicename.test.com


# Development

This project is tested with bash and Vagrant.

### Requirements
1. Install [Virtualbox](https://www.virtualbox.org/)
2. Install [Vagrant](https://www.vagrantup.com/)
3. Run `bash tests/vagrant-tests.sh`