bash 'install_elastic1' do
	code <<-EOH
    sudo yum -y install java-1.8.0-openjdk
	EOH
end

cookbook_file '/etc/yum.repos.d/elasticsearch.repo' do
	source 'elasticsearch.repo'
	mode 0644
	owner 'root'
	group 'wheel'
end

bash 'install_elastic2' do
	code <<-EOH
    yum -y install elasticsearch
	EOH
end