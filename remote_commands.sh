



echo "//////////////////////////////////////////"
echo "//////////////////////////////////////////"
echo "//////////////////////////////////////////"
echo "bootstrapping dokku"
echo "//////////////////////////////////////////"
echo "//////////////////////////////////////////"
echo "//////////////////////////////////////////"
# we're getting stable branch, but using newer bootstrapper (it does the python software props)
wget -qO- https://raw.github.com/progrium/dokku/master/bootstrap.sh | DOKKU_TAG=v0.2.1 bash


echo "//////////////////////////////////////////"
echo "//////////////////////////////////////////"
echo "//////////////////////////////////////////"
echo "adding a swapfile"
echo "//////////////////////////////////////////"
echo "//////////////////////////////////////////"
echo "//////////////////////////////////////////"
dd if=/dev/zero of=/swapfile bs=1024 count=2048k
mkswap /swapfile
swapon /swapfile
echo "/swapfile       none    swap    sw      0       0" >> /etc/fstab
echo 25 | tee /proc/sys/vm/swappiness
echo vm.swappiness = 25 | tee -a /etc/sysctl.conf
chown root:root /swapfile 
chmod 0600 /swapfile


echo "//////////////////////////////////////////"
echo "//////////////////////////////////////////"
echo "//////////////////////////////////////////"
echo "Installing Plugins"
echo "//////////////////////////////////////////"
echo "//////////////////////////////////////////"
echo "//////////////////////////////////////////"
# NOTE, don't run the domain commands while ssh'd in as root!
git clone https://github.com/wmluke/dokku-domains-plugin.git /var/lib/dokku/plugins/domains-plugin
git clone https://github.com/musicglue/dokku-user-env-compile.git /var/lib/dokku/plugins/user-env-compile
dokku plugins-install



# http://wiki.nginx.org/HttpCoreModule
# see client_max_body_size config at link above.  Without setting this, nginx would block 
# uploads of greater than the default, which is 1m
sed -i 's/.*http {.*/&\n        client_max_body_size 0;/' /etc/nginx/nginx.conf

