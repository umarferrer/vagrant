# -*- mode: ruby -*-
# vi: set ft=ruby :

hostname      = "vaprobash.dev"
server_ip     = "192.168.33.10"
server_memory = "2048" # MB
FOLDER        = "/var/www/$PROJECT$"
PORT          = "8888"

Vagrant.configure("2") do |config|

    config.vm.box = "chef/debian-7.4"
    config.vm.box_url = "http://vagrantcloud.com/chef/debian-7.4/version/1/provider/virtualbox.box"

    config.vm.hostname = hostname

    if Vagrant.has_plugin?("vagrant-proxyconf")
        config.proxy.http     = "http://163.110.224.33:8080/"
        config.proxy.https    = "http://163.110.224.33:8080/"
        config.proxy.no_proxy = "localhost,127.0.0.1,.example.com"
    end

    config.vm.network "forwarded_port", guest: 80, host: PORT
    config.vm.network :private_network, ip: server_ip

    config.vm.synced_folder FOLDER, "/var/www",
        id: "core",
        :nfs => true,
        :mount_options => ['nolock,vers=3,udp,noatime']

    config.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", server_memory]
        vb.customize ["guestproperty", "set", :id, "/VirtualBox/GuestAdd/VBoxService/--timesync-set-threshold", 10000]
    end

    config.vm.provision "shell", path: "scripts/utils.sh"
    config.vm.provision "shell", path: "scripts/php5.5.sh"
    config.vm.provision "shell", path: "scripts/vhost.sh"
    config.vm.provision "shell", path: "scripts/mysql.sh"
    #config.vm.provision "shell", path: "scripts/s2.sh"
    config.vm.provision "shell", path: "scripts/extra.sh"

end