/usr/bin/rm -r  /tmp/disposeablepipevn 2>/dev/null
python3 -m vevn /tmp/disposeablepipevn
source /tmp/disposeablepipevn/bin/activate

pip3 install virt-lightning
sudo mkdir -p /var/lib/virt-lightning/pool/upstream
sudo chown -R qemu:qemu /var/lib/virt-lightning/pool
sudo chown -R jho /var/lib/virt-lightning/pool/upstream
sudo chmod 775 /var/lib/virt-lightning
sudo chmod 775 /var/lib/virt-lightning/pool /var/lib/virt-lightning/pool/upstream

vl down
vl fetch centos-7
vl fetch centos-8
vl up
vl ansible_inventory > inventory

echo "UserKnownHostsFile=/dev/null"  > ~/.ssh/vl-config
echo "StrictHostKeyChecking=no"     >> ~/.ssh/vl-config
echo ""                             >> ~/.ssh/vl-config

vl ssh_config >>  ~/.ssh/vl-config
for SERVER in centos-7 centos-8 
do
	ssh -F  ~/.ssh/vl-config ${SERVER}  'sudo sed "s/#UseDNS yes/UseDNS no/" /etc/ssh/sshd_config > /tmp/sshd_config'
	ssh -F  ~/.ssh/vl-config ${SERVER}  'sudo cp /tmp/sshd_config /etc/ssh/sshd_config'
	ssh -F  ~/.ssh/vl-config ${SERVER}  'sudo systemctl restart sshd'
done



echo "All setup"




