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

# Lab environment

You can easily run a lab environment with Vagrant. 

### Requirements
1. Install [Virtualbox](https://www.virtualbox.org/)
2. Install [Vagrant](https://www.vagrantup.com/)
3. Run `vagrant up`
3. Put the following in your `/etc/hosts` file: 
   * `192.168.254.2    *.test.com` 
4. Now navigate to any of the services at http://servicename.test.com


# Development

This project is tested with bash and Vagrant.

### Requirements
1. Install [Virtualbox](https://www.virtualbox.org/)
2. Install [Vagrant](https://www.vagrantup.com/)
3. Run `bash tests/vagrant-tests.sh`