#
# Cookbook Name:: gibapache
# Recipe:: default
#
# Copyright 2013, Gibmedia
#
# All rights reserved - Do Not Redistribute
#

yum_package "httpd.x86_64" do
  action :install
end

user "www" do
  supports :manage_home => true
  comment "www"
  uid 502
  gid "apache"
  home "/home/www"
  shell "/bin/bash"
end

service "gibapache" do
  service_name "httpd"
  restart_command "/sbin/service httpd restart && sleep 1"
  reload_command "/sbin/service httpd reload && sleep 1"
  supports [:restart, :reload, :status]
  action :enable
end

directory node['gibapache']['docroot_dir'] do
    mode 00755
end

%w{gibproject sfproject html}.each do |dir|
directory "#{node['gibapache']['docroot_dir']}/#{dir}" do
    mode 00755
    owner node[:gibapache][:user]
    group node[:gibapache][:group]
    action :create
    recursive true
end
end

%w{web libs cache data}.each do |dir|
directory "#{node['gibapache']['docroot_dir']}/gibproject/#{dir}" do
    mode 00755
    owner node[:gibapache][:user]
    group node[:gibapache][:group]
    action :create
    recursive true
end
end

directory node['gibapache']['log_dir'] do
    mode 00755
    owner node[:gibapache][:user]
    group node[:gibapache][:group]
    action :create
end

directory "#{node['gibapache']['log_dir']}/vhosts/default" do
    mode 00755
    owner node[:gibapache][:user]
    group node[:gibapache][:group]
    action :create
    recursive true
end

directory "#{node['gibapache']['log_dir']}/vhosts" do
    mode 00755
    owner node[:gibapache][:user]
    group node[:gibapache][:group]
end

%w{vhosts sf}.each do |dir|
directory "#{node['gibapache']['ServerRoot']}/conf/#{dir}" do
    mode 00755
    action :create
    recursive true
end
end

template "/etc/httpd/conf/httpd.conf" do
  path "#{node['gibapache']['ServerRoot']}/conf/httpd.conf"
  source "httpd.conf.erb"
  owner "root"
group "root"
mode 00644
  notifies :restart, "service[gibapache]"
end

cookbook_file "#{node['gibapache']['ServerRoot']}/conf/sf/vhosts.conf" do
  source "vhosts.conf"
  mode "0644"
end

service "gibapache" do
  action :start
end
