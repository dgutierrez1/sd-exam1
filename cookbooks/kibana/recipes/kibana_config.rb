

bash 'config_kibana1' do
    user 'root'
    code <<-EOH
    systemctl start firewalld
    firewall-cmd --add-port=5601/tcp
    firewall-cmd --add-port=5601/tcp --permanent
    systemctl restart network
    
    sudo yum install -y unzip
	EOH
end

#curl -L -O https://download.elastic.co/beats/dashboards/beats-dashboards-1.2.2.zip  | unzip | ./load.sh
# bash 'config_kibana2' do
#     user 'root'
#     code <<-EOH
#     ./beats-dashboards-*/load.sh
# 	EOH
# end
# bash 'setup_kibana_dashboards' do
#     user 'root'
#     code <<-EOH
#     sudo systemctl restart kibana        
#     sudo systemctl daemon-reload
#     . /home/vagrant/dashboards/load.sh
# 	EOH
# end

bash 'config_kibana3' do
    user 'root'
    code <<-EOH
    sudo systemctl restart kibana            
    sudo systemctl restart kibana    
    sudo systemctl enable kibana
    sudo systemctl start kibana
    curl -O https://gist.githubusercontent.com/thisismitch/3429023e8438cc25b86c/raw/d8c479e2a1adcea8b1fe86570e42abab0f10f364/filebeat-index-template.json && curl -XPUT 'http://192.168.56.105:9200/_template/filebeat?pretty' -d@filebeat-index-template.json    
    sudo systemctl restart kibana
	EOH
end
