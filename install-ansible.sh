#!/usr/bin/env bash

# Install Ansible Distribution
# https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#installing-ansible-on-ubuntu


# check os type
if [ -f /etc/redhat-release ]; then
    OS_TYPE="redhat"
elif [ -f /etc/lsb-release ]; then
    OS_TYPE="ubuntu"
else
    echo "Unsupported OS"
    exit 1
fi

# install ansible_distribution
if [ "$OS_TYPE" == "redhat" ]; then
    sudo yum install -y epel-release
    sudo yum install -y ansible
elif [ "$OS_TYPE" == "ubuntu" ]; then
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    sudo apt-add-repository -y ppa:ansible/ansible
    sudo apt-get update
    sudo apt-get install -y ansible
fi

# check ansible version
ansible --version

# install ansible roles
ansible-galaxy install -r ansible_galaxy_requirements.yml

# install ansible collections
ansible-galaxy collection install -r ansible_galaxy_collections.yml

# install ansible modules
ansible-galaxy module install -r ansible_galaxy_modules.yml
