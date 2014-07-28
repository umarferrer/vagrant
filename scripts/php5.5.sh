echo "deb http://packages.dotdeb.org wheezy all" > /etc/apt/sources.list.d/php55
echo "deb-src http://packages.dotdeb.org wheezy all" >> /etc/apt/sources.list.d/php55
echo "deb http://packages.dotdeb.org wheezy-php55 all" >> /etc/apt/sources.list.d/php55
echo "deb-src http://packages.dotdeb.org wheezy-php55 all" >> /etc/apt/sources.list.d/php55
wget http://www.dotdeb.org/dotdeb.gpg
apt-key add dotdeb.gpg
apt-get update
apt-get install -y php5 php5-cli php5-intl php5-curl php5-mysql php5-gd php5-gmp php5-mcrypt php5-xdebug php5-memcached php5-imagick php5-intl
