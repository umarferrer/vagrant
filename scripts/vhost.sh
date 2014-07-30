PROJECT = $1
VHOST=$(cat <<EOF
<VirtualHost *:80>
  DocumentRoot "/var/www/web" 
  ServerName $1.local
  <Directory "/var/www/web">
    AllowOverride None
  </Directory>

</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-enabled/000-default
sudo a2enmod rewrite
sudo /etc/init.d/apache2 reload


