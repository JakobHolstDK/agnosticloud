sudo dnf -y update
sudo dnf -y module install virt 
sudo dnf -y install virt-install virt-viewer
sudo dnf -y install qemu-kvm qemu-img virt-manager virt-viewer libvirt-daemon python3-pip  libvirt-client dnsmasq  python3-virtualenv pkg-config libvirt gcc make
sudo su -c "useradd miracle -s /bin/bash -m -g libvirt -G qemu"
sudo mkdir -p /var/lib/virt-lightning/pool/upstream
sudo chown -R qemu:kvm /var/lib/virt-lightning/pool
sudo chown -R miracle:qemu /var/lib/virt-lightning/pool/upstream
sudo chmod 775 /var/lib/virt-lightning
sudo chmod 775 /var/lib/virt-lightning/pool /var/lib/virt-lightning/pool/upstream
sudo systemctl start libvirtd
sudo systemctl enable libvirtd
sudo systemctl status libvirtd

