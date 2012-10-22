# Require spree_essential_example and spree_atuh in config/application.rb
gsub_file "config/application.rb", 'require "spree_essential_cms"', %(require "spree_essential_cms"
require "spree_auth_devise"
require "spree")

# Install spree's migrations
rake "spree:install:migrations"

# Mount the Spree::Core routes
insert_into_file File.join('config', 'routes.rb'), :after => "Application.routes.draw do\n" do
  "  # Mount Spree's routes\n  mount Spree::Core::Engine, :at => '/'\n"
end

# Install spree essentials & CMS
run "bundle exec rails g spree_essentials:install"
run "bundle exec rails g spree_essentials:cms"
