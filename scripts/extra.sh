sudo echo "xdebug.max_nesting_level=2000" >> /etc/php5/apache2/conf.d/20-xdebug.ini 
sudo service apache2 restart

echo "" > /home/vagrant/.bash_profile
#auto-complete symfony2
cd /home/vagrant
git clone https://github.com/jaytaph/SFConsole.git
cd SFConsole
mv console_completion.sh ../.console_completion.sh
cd ..
rm -rf SFConsole
sudo echo ". ~/.console_completion.sh" >> /home/vagrant/.bash_profile

#Ssh connect redirect to /var/www
sudo echo "cd /var/www" >> /home/vagrant/.bash_profile

#Pretty shell
sudo echo 'parse_git_branch() {' >> /home/vagrant/.bash_profile
sudo echo "git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'" >> /home/vagrant/.bash_profile
sudo echo '}' >> /home/vagrant/.bash_profile
sudo echo 'export PS1="\e[33m\u\e[0m \e[34m\w\e[0m\e[33m\$(parse_git_branch)\e[34m $ "' >> /home/vagrant/.bash_profile