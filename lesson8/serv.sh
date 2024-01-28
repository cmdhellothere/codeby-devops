sudo apt update && apt install apache2 -y
sudo a2enmod rewrite
sudo a2enmod ssl
openssl req -newkey rsa:2048 -nodes -keyout /etc/ssl/serv.key -x509 -days 365 -subj "/C=RU/ST=Moscow/L=Moscow/O=LTD/CN=saitik.local" -out /etc/ssl/serv.crt
cp /etc/ssl/serv.crt /vagrant/
cp /vagrant/saitik.local.conf /etc/apache2/sites-available/
cp /vagrant/saitik.html /var/www/html/

a2dissite 000-default.conf
a2ensite saitik.local.conf
systemctl reload apache2
