cookbook_file '/opt/kibana/config/kibana.yml' do
	source 'kibana.yml'
	mode 0644
	owner 'root'
	group 'wheel'
end

remote_directory '/home/vagrant/dashboards' do
	source 'dashboards'
	owner 'root'
	group 'root'
	mode '0755'
	action :create
  end