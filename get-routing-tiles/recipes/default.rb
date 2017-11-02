#
# Cookbook Name:: get-routing-tiles
# Recipe:: default
#
# Copyright 2016, Mapzen
#
# All rights reserved - Do Not Redistribute
#

# make the valhalla user
user node['get-routing-tiles']['user']['name'] do
  uid         node['get-routing-tiles']['user']['uid']
  gid         node['get-routing-tiles']['user']['gid']
  manage_home false
  home        node['get-routing-tiles']['base_dir']
  not_if      { node['get-routing-tiles']['user']['name'] == 'root' }
end

# set up directory structure
dirs = [
  node['get-routing-tiles']['base_dir'],
  node['get-routing-tiles']['log_dir'],
  node['get-routing-tiles']['tile_dir'],
  node['get-routing-tiles']['transit_dir'],
  node['get-routing-tiles']['elevation_dir']
]

dirs.each do |d|
  directory d do
    owner node['get-routing-tiles']['user']['name']
    recursive true
  end
end

include_recipe 'get-routing-tiles::pull'
