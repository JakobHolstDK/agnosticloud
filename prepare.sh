/usr/bin/rm -r  /tmp/disposeablepipevn 2>/dev/null
python3 -m venv /tmp/disposeablepipevn
source /tmp/disposeablepipevn/bin/activate
pip install --upgrade pip
pip install virt-lightning

vl down
vl fetch centos-7
vl fetch centos-8
cat virt-lightning.yaml |grep "\- name"|awk '{ print $3 }' |xargs -i{} vl stop {} >/dev/null 2>&1

vl up
vl ansible_inventory > inventory
pip install kolla-ansible
mkdir -p /etc/kolla


echo "All setup"




