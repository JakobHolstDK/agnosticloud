sudo dnf -y update
sudo dnf  install qemu-kvm qemu-img virt-manager virt-viewer libvirt-daemon python3-pip  libvirt-clients dnsmasq qemu-utils  python3.8-venv pkg-config qemu-block-extra



exit


sudo su -c "useradd miracle -s /bin/bash -m -g libvirt -G libvirt-qemu"
sudo mkdir -p /var/lib/virt-lightning/pool/upstream
sudo chown -R libvirt-qemu:kvm /var/lib/virt-lightning/pool
sudo chown -R miracle /var/lib/virt-lightning/pool/upstream
sudo chmod 775 /var/lib/virt-lightning
sudo chmod 775 /var/lib/virt-lightning/pool /var/lib/virt-lightning/pool/upstream

