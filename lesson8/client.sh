echo "192.168.201.21 saitik.local www.saitik.local" >> /etc/hosts
cp /vagrant/serv.crt /usr/local/share/ca-certificates/ca-serv.crt
update-ca-certificates -v