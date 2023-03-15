#!/bin/bash

sudo apt-get update -qq 2>&1 >/dev/null
sudo apt-get update
sudo apt-get install software-properties-common -y 2>&1 >/dev/null
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt-get install ansible -y 2>&1 >/dev/null

echo "autocmd filetype yaml setlocal ai ts=2 sw=2 et" > /home/vagrant/.vimrc

sudo chown vagrant:vagrant /home/vagrant/.vimrc