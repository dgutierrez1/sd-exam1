cookbook_file '/etc/logstash/conf.d/logstash.conf' do
	source 'logstash.conf'
	mode 0644
	owner 'root'
	group 'wheel'
end