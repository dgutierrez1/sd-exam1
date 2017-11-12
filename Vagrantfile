
Vagrant.configure("2") do |config|
  
  # FILEBEAT
  config.vm.define :filebeat_server do |filebeat|
    filebeat.vm.box = "Centos1704v2"
    filebeat.vm.network :private_network, ip: "192.168.56.102"
    filebeat.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512","--cpus", "1", "--name", "filebeat_server" ]
    end
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "filebeat"
    end
  end

  # LOGSTASH
  config.vm.define :logstash_server do |logstash|
    logstash.vm.box = "Centos1704v2"
    logstash.vm.network :private_network, ip: "192.168.56.103"
    logstash.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512","--cpus", "1", "--name", "logstash_server" ]
    end
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "logstash"
    end
  end

  # ELASTIC
  config.vm.define :elastic_server do |elastic|
    elastic.vm.box = "Centos1704v2"
    elastic.vm.network :private_network, ip: "192.168.56.104"
    elastic.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "1024","--cpus", "1", "--name", "elastic_server" ]
    end
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "elastic"
    end
  end
  
  # KIBANA
  config.vm.define :kibana_server do |kibana|
    kibana.vm.box = "Centos1704v2"
    kibana.vm.network :private_network, ip: "192.168.56.105"
    kibana.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", "512","--cpus", "1", "--name", "kibana_server" ]
    end
    config.vm.provision :chef_solo do |chef|
      chef.cookbooks_path = "cookbooks"
      chef.add_recipe "kibana"
    end
  end

end