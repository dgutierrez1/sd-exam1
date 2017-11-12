# bash 'install_logstash_plugin' do
# 	code <<-EOH
#     ./bin/logstash-plugin update logstash-input-beats    
# 	EOH
# end
bash 'open_port' do
    user 'root'
    code <<-EOH
    systemctl start firewalld
    firewall-cmd --add-port=5044/tcp
    firewall-cmd --add-port=5044/tcp --permanent
    systemctl restart network
	EOH
end

bash 'start_logstash' do
	code <<-EOH
    sudo service logstash start
	EOH
end
