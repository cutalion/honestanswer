source 'https://rubygems.org' # Changed to https

gem 'rails', '~> 7.0.8' # Updated for 7.0.x patch
gem 'thin'
gem 'bootsnap', '>= 1.9.0', require: false # Updated for 7.0
gem 'redis', '~> 4.8' # Added for Action Cable

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mongoid', '~> 7.5.0' # Updated for 7.0
gem 'bson_ext' # Still needed with older Mongoid versions, may need specific version later

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 6.0.0' # Kept for 7.0 (Sprockets)
  gem 'coffee-rails', '~> 5.0.0' # Kept for 7.0 (Sprockets)
  gem 'uglifier', '~> 2.5.0' # Kept from 4.0 update / High risk for 7.0
  gem 'twitter-bootstrap-rails', '~> 3.2.0' # Kept from 4.0 update / High risk for 7.0
end

gem 'jquery-rails', '~> 4.5.0' # Updated for 7.0
gem 'haml-rails', '~> 2.0.1' # Kept for 7.0
gem 'simple_form', '~> 5.2.0' # Updated for 7.0
gem 'inherited_resources', '~> 1.14.0' # Updated for Rails 7.0 compatibility
gem 'encode_with_alphabet'
gem 'meta-tags', :require => 'meta_tags'

gem 'private_pub' # Will be removed later

# Heroku gem is for CLI, not usually needed in Gemfile for deployment
# gem 'heroku', :group => :development

gem 'foreman', :group => :development

group :development, :test do
  gem 'rspec-rails', '~> 5.1.0' # Updated for 7.0
  gem 'factory_girl_rails' # Might need update, e.g., factory_bot_rails
  # gem 'ruby-debug' # ruby-debug is old, consider 'debug' or 'byebug' for newer Rubies
  gem 'guard'
  gem 'guard-rspec'
  gem 'spring', group: :development # Added for 4.1
end

group :test do
  gem 'mongoid-rspec' # Might need update
  gem 'capybara' # Might need update
  gem 'shoulda' # shoulda-matchers is common now
  gem 'database_cleaner' # Might need update, or database_cleaner-mongoid
end
