#
# Cookbook Name:: pull
# Recipe:: default
#
# Copyright 2016, Mapzen
#
# All rights reserved - Do Not Redistribute
#

stack = search('aws_opsworks_stack').first

# go get the tiles
execute 'pull tiles' do
  user  node['get-routing-tiles']['user']['name']
  cwd   node['get-routing-tiles']['base_dir']
  command <<-EOH
    aws --region #{stack['region']} s3 ls s3://#{node['get-routing-tiles']['s3bucket']}/#{node['get-routing-tiles']['s3bucket_dir']}/ | grep -F planet_ | awk '{print $4}' | sort | tail -n 1 > latest_tiles.txt &&
    aws --region #{stack['region']} s3 cp s3://#{node['get-routing-tiles']['s3bucket']}/#{node['get-routing-tiles']['s3bucket_dir']}/$(cat latest_tiles.txt) #{node['get-routing-tiles']['tile_dir']}/tiles.tar
  EOH
  timeout 3600
end
