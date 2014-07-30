if [ ! -f /var/www/composer.json ]
then
    curl -sS https://getcomposer.org/installer | php
    mv composer.phar /usr/local/bin/composer

    composer create-project symfony/framework-standard-edition /var/www/tmp "2.5.*" 
    mv /var/www/tmp/* /var/www && rmdir /var/www/tmp
    cd /var/www/ && composer require "phpunit/phpunit=*" 
    cd /var/www/ && composer require "sebastian/phpcpd=*" 
    cd /var/www/ && composer require "phing/phing=*" 
fi