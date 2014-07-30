apt-get update
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

apt-get install -y mysql-server mysql-client php5-mysql
sed -i 's/;date\.timezone =/date\.timezone = Europe\/Paris/g' /etc/php5/apache2/php.ini
sed -i 's/;date\.timezone =/date\.timezone = Europe\/Paris/g' /etc/php5/cli/php.ini