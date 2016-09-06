curl -L https://bootstrap.saltstack.com -o bootstrap_salt.sh
sudo sh bootstrap_salt.sh
rm /usr/bin/java
echo <<EOT >> /etc/salt/minion.d/grains.conf
grains:
  roles:
    - zookeeper
EOT
echo "file_client: local" >> /etc/salt/minion
/etc/init.d/salt-minion restart
salt-call --local state.apply
