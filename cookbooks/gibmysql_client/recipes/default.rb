#
# Cookbook Name:: gibmysql_client
# Recipe:: default
#
# Copyright 2013, GIBMEDIA
#
# All rights reserved - Do Not Redistribute
#

node['gibmysql_client']['packages'].each do |mysql_pack|
  package mysql_pack do
      action :install
  end
end
