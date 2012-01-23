source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

gem 'imgkit'
gem "rmagick"
gem 'carrierwave' 

gem 'fog'
gem 'heroku'

gem 'zurb-foundation'

gem 'event-calendar', :require => 'event_calendar' 

gem 'nokogiri'
gem 'mechanize'

gem 'will_paginate', '~> 3.0' 
gem "friendly_id", "~> 4.0.0"
gem "url_formatter"

gem 'delayed_job_active_record'              
gem 'daemons'

group :production do
  gem 'pg'
end    

group :development, :test do
  gem 'sqlite3'
end


# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "rspec-rails", :group => [:test, :development]
group :test do
  gem "factory_girl_rails",   "< 1.4.2"
  gem "capybara"
  gem "guard-rspec"
  gem "spork", "> 0.9.0.rc"
  gem "guard-spork"
end
