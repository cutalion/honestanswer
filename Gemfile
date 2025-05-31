source 'https://rubygems.org' # Changed to https

gem 'rails', '~> 5.1.0' # Updated for 5.1
gem 'thin'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'mongoid', '~> 6.1.0' # Updated for 5.1
gem 'bson_ext' # Still needed with older Mongoid versions, may need specific version later

gem 'json'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 5.0' # Kept from 4.2 update
  gem 'coffee-rails', '~> 4.2.1' # Kept for 5.1 (4.2.2 also an option)
  gem 'uglifier', '~> 2.5.0' # Kept from 4.0 update / Needs review for 5.x
  gem 'twitter-bootstrap-rails', '~> 3.2.0' # Kept from 4.0 update / Needs review for 5.x
end

gem 'jquery-rails', '~> 4.3.1' # Updated for 5.1
gem 'haml-rails', '~> 1.0.0' # Kept for 5.1
gem 'simple_form', '~> 3.5.0' # Kept for 5.1
gem 'inherited_resources', '~> 1.7.2' # Updated for 5.1
gem 'encode_with_alphabet'
gem 'meta-tags', :require => 'meta_tags'

gem 'private_pub' # Will be removed later

# Heroku gem is for CLI, not usually needed in Gemfile for deployment
# gem 'heroku', :group => :development

gem 'foreman', :group => :development

group :development, :test do
  gem 'rspec-rails', '~> 3.6.0' # Updated for 5.1
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
