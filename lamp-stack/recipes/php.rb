package "php" do
  action :install
end

package "php-pear" do
  action :install
end

package "php-mysql" do
  action :install
end
# this is not working on 08/15.Becuase current
#version is php7
cookbook_file "/etc/php5/apache2/php.ini" do
  source "php.ini"
  mode "0644"
  notifies :restart, "service[apache2]"
end

execute "chownlog" do
  command "chown www-data /var/log/php"
  action :nothing
end

directory "/var/log/php" do
  action :create
  notifies :run, "execute[chownlog]"
end
