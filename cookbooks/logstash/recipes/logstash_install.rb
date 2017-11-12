cookbook_file '/etc/yum.repos.d/logstash.repo' do
    source 'logstash.repo'
    mode 0644
end


bash 'install_logstash' do
	code <<-EOH
    sudo yum install -y java-1.8.0-openjdk
    sudo yum -y install logstash
	EOH
end
