source 'http://rubygems.org'

gem 'rails', '3.1.0'
gem 'thin'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mongoid'
gem 'bson_ext'

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
  gem 'bourbon'
  gem 'blueprint-rails'
end

gem 'jquery-rails'
gem 'haml'
gem 'simple_form'
gem 'inherited_resources'
gem 'encode_with_alphabet'
gem 'meta-tags', :require => 'meta_tags'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

group :development, :test do
  gem 'rspec-rails'
  gem 'machinist_mongo', :git => 'https://github.com/nmerouze/machinist_mongo.git', :require => 'machinist/mongoid', :branch => 'machinist2'
  gem 'machinist', '>= 2.0.0.beta2'
  gem 'ruby-debug'
end

group :development do
  gem 'watchr'
end

group :test do
  gem 'mongoid-rspec'
  gem 'capybara'
  gem 'shoulda'
  gem 'database_cleaner'
end
