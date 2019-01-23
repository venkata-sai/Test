#!/bin/bash

# YUM

sudo yum -y install git \
                    gcc \
                    curl \
                    python-devel \
                    htop \
                    iftop \
                    jq

sudo yum remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-selinux \
                  docker-engine-selinux \
                  docker-engine

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install -y docker-ce-17.12.1.ce

sudo yum install -y glibc-static \
                  unzip \
                  pciutils \

sudo yum update -y

# PIP
sudo easy_install pip
sudo pip install -U pip

sudo pip install docker-py


# Java
sudo mkdir -p /opt/bixby/

sudo wget -q -O /opt/bixby/jdk-8u161-linux-x64.tar.gz  --no-check-certificate --no-cookies --header 'Cookie: oraclelicense=accept-securebackup-cookie' http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-linux-x64.tar.gz  creates=/opt/bixby/jdk-8u161-linux-x64.tar.gz

sudo tar -zxf /opt/bixby/jdk-8u161-linux-x64.tar.gz -C /opt/bixby
sudo chown -R root:root /opt/bixby

sudo alternatives --install "/usr/bin/java" "java" "/opt/bixby/jdk1.8.0_161/bin/java" 2000

sudo rm /opt/bixby/jdk-8u161-linux-x64.tar.gz

sudo chown -R root:root /mnt/bixby

sudo reboot
