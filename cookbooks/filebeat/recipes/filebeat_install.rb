cookbook_file '/etc/yum.repos.d/filebeat.repo' do
    source 'filebeat.repo'
    mode 0644
end

bash 'install_filebeat' do
	code <<-EOH
    sudo yum -y install filebeat
	EOH
end
