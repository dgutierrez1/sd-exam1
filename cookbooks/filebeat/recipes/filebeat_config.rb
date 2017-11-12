bash 'start_filebeat' do
    user 'root'
    code <<-EOH
    systemctl daemon-reload
    systemctl enable filebeat
    systemctl start filebeat
    systemctl restart network
    EOH
  end