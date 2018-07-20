package 'nginx'

file '/etc/nginx/sites-enabled/default' do
  action :delete
end

remote_file '/etc/nginx/conf.d/hello.conf' do
  owner 'root'
  group 'root'
  mode '644'
end
