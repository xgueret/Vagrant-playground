#!/bin/bash


echo "
10.0.10.10 control-ans
10.0.10.11 node1-ans
10.0.10.12 node2-ans
" >> /etc/hosts


# mise à jour et installation des packages utils
sudo apt-get update -qq 2>&1 >/dev/null
sudo apt-get install python3-pip -y 2>&1 >/dev/null
sudo apt-get install -y -qq git vim tree net-tools telnet 2>&1 >/dev/null

#sed -i 's/ChallengeResponseAuthentication no/ChallengeResponseAuthentication yes/g' /etc/ssh/sshd_config
#sudo systemctl restart sshd