#!/bin/bash
echo "Starting nvidia script.."

sudo yum install -y gcc kernel-devel-$(uname -r)

cd /opt/bibxy/

echo "wget nvidia"
sudo wget -nv http://us.download.nvidia.com/XFree86/Linux-x86_64/367.106/NVIDIA-Linux-x86_64-367.106.run

sudo /bin/bash ./NVIDIA-Linux-x86_64-367.106.run --no-questions --accept-license --no-precompiled-interface --run-nvidia-xconfig --silent

sudo reboot
