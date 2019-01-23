#!/bin/bash 

echo "Starting init script.."

sudo yum -y install wget

sudo wget -O /tmp/epel-release-7-11.noarch.rpm dl.fedoraproject.org/pub/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm
sudo rpm -ihv /tmp/epel-release-7-11.noarch.rpm

sudo yum -y install gcc \
                    glibc-static \
                    python-devel \

sudo yum update -y

# Install Pip
sudo easy_install pip
sudo pip install -U pip setuptools

cat <<EOT > /tmp/requirements.txt
ansible==2.5.0
awscli==1.14.70
credstash==1.13.3
cryptography==2.0.3
EOT

sudo pip install -r /tmp/requirements.txt

echo "Finished init script"

