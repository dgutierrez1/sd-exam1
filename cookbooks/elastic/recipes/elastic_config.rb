service "firewalld" do
	action [ :enable, :start]
end

bash 'open_port' do
    code <<-EOH
    sudo firewall-cmd --add-port=9200/tcp
    sudo firewall-cmd --add-port=9200/tcp --permanent
    sudo systemctl restart network
	EOH
end

bash 'start_elastic' do
    code <<-EOH
    curl -O https://gist.githubusercontent.com/thisismitch/3429023e8438cc25b86c/raw/d8c479e2a1adcea8b1fe86570e42abab0f10f364/filebeat-index-template.json && curl -XPUT 'http://192.168.56.104:9200/_template/filebeat?pretty' -d@filebeat-index-template.json
    sudo service elasticsearch start  
	EOH
end
