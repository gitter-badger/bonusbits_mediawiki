# Base Setup
include_recipe 'bonusbits_base'

# Fetch Data Bag
data_bag = node['bonusbits_mediawiki_nginx']['data_bag']
data_bag_item = node['bonusbits_mediawiki_nginx']['data_bag_item']
node.run_state['data_bag'] = data_bag_item(data_bag, data_bag_item)

# Install Software Packages
package node['bonusbits_mediawik_nginx']['packages']

# Install and Configure Nginx
include_recipe 'bonusbits_mediawiki_nginx::nginx'

# Install and Configure Php Fpm
include_recipe 'bonusbits_mediawiki_nginx::php_fpm'

# Install and Configure Nginx
include_recipe 'bonusbits_mediawiki_nginx::mediawiki'

# Setup Sendmail
include_recipe 'bonusbits_mediawiki_nginx::sendmail' if node['bonusbits_mediawiki_nginx']['sendmail']['configure']

# Deploy DNS Update Script
include_recipe 'bonusbits_mediawiki_nginx::dns' if node['bonusbits_mediawiki_nginx']['dns']['configure']
