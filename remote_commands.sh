# bootstrap Dokku
# we're getting stable branch, but using newer bootstrapper (it does the python software props)
wget -qO- https://raw.github.com/progrium/dokku/master/bootstrap.sh | sudo DOKKU_TAG=v0.2.1 bash

# Add a Swapfile
dd if=/dev/zero of=/swapfile bs=1024 count=2048k
mkswap /swapfile
swapon /swapfile
echo "/swapfile       none    swap    sw      0       0" >> /etc/fstab
echo 0 | sudo tee /proc/sys/vm/swappiness
echo vm.swappiness = 25 | sudo tee -a /etc/sysctl.conf
chown root:root /swapfile 
chmod 0600 /swapfile

# install the domains plugin
# NOTE, don't run the domain commands while ssh'd in as root!
git clone https://github.com/wmluke/dokku-domains-plugin.git /var/lib/dokku/plugins/domains-plugin
dokku plugins-install

