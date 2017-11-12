
bash 'install_kibana' do
    user 'root'
    code <<-EOH
    sudo yum makecache fast
    sudo yum -y install java
	EOH
end

cookbook_file '/etc/yum.repos.d/kibana.repo' do
	source 'kibana.repo'
	mode 0644
	owner 'root'
	group 'wheel'
end

bash 'install_kibana' do
    user 'root'
    code <<-EOH
    yum -y install kibana
	EOH
end