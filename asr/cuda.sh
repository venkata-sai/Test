#!/bin/bash

echo "start cuda script."

cd /opt/bixby

sudo wget -nv http://developer.download.nvidia.com/compute/cuda/6_5/rel/installers/cuda_6.5.14_linux_64.run
sudo mkdir -p /opt/bixby/tmp
sudo chmod +x ./cuda_6.5.14_linux_64.run
sudo ./cuda_6.5.14_linux_64.run -silent -toolkit -toolkitpath=/usr/local/cuda6.5 -verbose -tmpdir /opt/bixby/tmp --override

echo "finish cuda script"
