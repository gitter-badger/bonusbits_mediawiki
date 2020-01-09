mediawiki_path = node['bonusbits_mediawiki']['mediawiki']['mediawiki_path']
mediawiki_user = node['bonusbits_mediawiki']['nginx']['user']
mediawiki_group = node['bonusbits_mediawiki']['nginx']['group']
version_major = node['bonusbits_mediawiki']['mediawiki']['version_major']
version_minor = node['bonusbits_mediawiki']['mediawiki']['version_minor']

# Load up Attributes with Data Bags Items
## Used Attributes so can override the values in environment is don't want to use data bag
node.default['bonusbits_mediawiki']['adsense']['header'] = node.run_state['data_bag']['adsense']['header']
node.default['bonusbits_mediawiki']['adsense']['footer'] = node.run_state['data_bag']['adsense']['footer']
node.default['bonusbits_mediawiki']['adsense']['sidebar'] = node.run_state['data_bag']['adsense']['sidebar']
node.default['bonusbits_mediawiki']['adsense']['mobile'] = node.run_state['data_bag']['adsense']['mobile']

# Deploy VectorTemplate with Ads
vector_template = "#{mediawiki_path}/skins/Vector/VectorTemplate.php"
template vector_template do
  source "mediawiki/adsense/VectorTemplate-#{version_major}.#{version_minor}.php.erb"
  owner mediawiki_user
  group mediawiki_group
  mode '0644'
  notifies :restart, 'service[nginx]', :delayed
end

# Deploy MobileFrontend Template with Ads
mobile_template = "#{mediawiki_path}/extensions/MobileFrontend/includes/skins/minerva.mustache"
template mobile_template do
  source "mediawiki/adsense/minerva-#{version_major}.#{version_minor}.mustache.erb"
  owner mediawiki_user
  group mediawiki_group
  mode '0644'
  notifies :restart, 'service[nginx]', :delayed
end

template '/var/www/html/mediawiki/ads.txt' do
  source 'mediawiki/adsense/ads.txt.erb'
  owner mediawiki_user
  group mediawiki_group
  mode '0644'
  notifies :restart, 'service[nginx]', :delayed
end
