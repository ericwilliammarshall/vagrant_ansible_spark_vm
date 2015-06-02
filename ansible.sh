#! /bin/bash
ansible-playbook -i .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory --private-key=.vagrant/machines/default/virtualbox/private_key -u vagrant provisioning/site.yml --sudo --limit @/Users/eric/site.retry
