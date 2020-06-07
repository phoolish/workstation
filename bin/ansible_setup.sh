#!/bin/bash

# If necessary, install ansible
if ! [ -x "$(command -v ansible)" ]; then
  sudo apt update
  sudo apt install software-properties-common
  sudo apt-add-repository --yes --update ppa:ansible/ansible
  sudo apt install ansible --yes
fi

#git pull origin master
ansible-galaxy install -r requirements.yml
ansible-playbook -i hosts local.yml --ask-become-pass
