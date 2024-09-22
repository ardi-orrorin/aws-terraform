#!/bin/bash

echo "Installing Docker started"

sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc


echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo curl -SL https://github.com/docker/compose/releases/download/v2.27.1/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

echo "Docker installed successfully"


echo "swap setting started"


sudo fallocate -l 2G /swapfile

chmod 600 /swapfile

sudo mkswap /swapfile
sudo swapon /swapfile

# 스왑 파일을 부팅시 자동으로 마운트하도록 설정
sudo echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# 스왑 비율 조정
sysctl vm.swappiness
sysctl vm.swappiness=30

sysctl vm.vfs_cache_pressure
vm.vfs_cache_pressure=10000

free
# 스왑 강제 초기화
# swapoff -a && swapon -a

"swap setting finished"