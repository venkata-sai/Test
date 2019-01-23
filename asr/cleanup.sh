#!/bin/bash -e
#
# This script cleans up the EC2 instance before baking the AMI.

function print_green {
  echo -e "\e[32m${1}\e[0m"
}

#print_green 'Clean yum'
#sudo yum -y autoremove

#print_green 'Remove SSH keys'
#[ -f /home/centos/.ssh/authorized_keys ] && rm /home/centos/.ssh/authorized_keys

print_green 'Cleanup log files'
sudo find /var/log -type f -exec truncate -s0 {} \;

print_green 'Cleanup bash history'
unset HISTFILE
[ -f /home/centos/.bash_history ] && rm /home/centos/.bash_history

print_green 'Cleanup temp files'

sudo rm -rf /tmp/*
[ -f /home/centos/.ansible ] && rm -rf /home/centos/.ansible

print_green 'Cleanup ansible-pull lock file'
sudo rm -f /var/lock/ansible-pull

print_green 'AMI cleanup complete!'


