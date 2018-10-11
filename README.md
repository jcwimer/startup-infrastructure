# startup-infrastructure

This is an Ansible playbook that configures a Docker Swarm cluster and deploys a full set of self hosted tools for a new company. After you point a wildcard A record to the swarm, you will be able to access the following tools. The goal of this project is to create a one stop shop for self hosting your infrastructure.

### Services
1. Git server - Using [Gitea](https://gitea.io/en-us/)
2. Password manager - [Bitwarden](https://bitwarden.com/)
3. Kanban - Wekan - [Wekan](https://wekan.github.io/)
4. Wiki - [Dokuwiki](https://www.dokuwiki.org/dokuwiki)

### URLs in your environment. If you use ssl obviously these will be https Assuming your A record is *.test.com:
1. http://git.test.com - Gitea
2. http://password.test.com - Bitwarden
3. http://kanban.test.com - Wekan
4. http://wiki.test.com - Dokuwiki

# Deploy

### Requirements
1. Python
2. Pip
3. Pipenv
4. SSH access to all nodes you're deploying to. 
   * You will need to define and environment variable for your ssh key. `export PRIVATE_KEY="/location/of/key"`
   * OR you will need a ssh agent running

### Steps
1. Copy hosts.example to hosts
    * Put ip addresses under the sections
    * Bootstrap will be the first node in the cluster. If you are only doing a one node cluster, this is where you put your ip
    * Managers are nodes used for managing a swarm cluster. Managers are recommended in 3's or 5's (bootstrap is a manager). Please see this for swarm best practices: https://docs.docker.com/engine/swarm/admin_guide/
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
   * `192.168.254.2    swarm.test.com` 
6. Now navigate to any of the services at http://servicename.test.com


# Development

This project is tested with bash and Vagrant.

### Requirements
1. Install [Virtualbox](https://www.virtualbox.org/)
2. Install [Vagrant](https://www.vagrantup.com/)
3. Run `bash tests/vagrant-tests.sh`