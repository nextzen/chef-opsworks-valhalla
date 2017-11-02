default['get-routing-tiles']['user'][:name]   = 'valhalla'
default['get-routing-tiles']['user'][:uid]    = '3445'
default['get-routing-tiles']['user'][:git]    = '3445'
default['get-routing-tiles']['base_dir']      = '/data'
default['get-routing-tiles']['s3bucket']      = 'mapzen.valhalla'
default['get-routing-tiles']['s3bucket_dir']  = 'prod'
default['get-routing-tiles']['log_dir']       = "#{node['get-routing-tiles']['base_dir']}/logs"
default['get-routing-tiles']['tile_dir']      = "#{node['get-routing-tiles']['base_dir']}/valhalla"
default['get-routing-tiles']['transit_dir']   = "#{node['get-routing-tiles']['base_dir']}/valhalla/transit"
default['get-routing-tiles']['elevation_dir'] = "#{node['get-routing-tiles']['base_dir']}/valhalla/elevation"