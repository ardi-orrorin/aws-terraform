
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