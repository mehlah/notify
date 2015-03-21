source 'https://rubygems.org'
source 'https://rails-assets.org'

ruby '2.1.2'

gem 'coffee-rails'
gem 'delayed_job_active_record'
gem 'devise'
gem 'email_validator'
gem 'foundation-rails', '~> 5.4.5'
gem 'high_voltage'
gem 'jbuilder', '~> 2.0'
gem 'jquery-rails'
gem 'pg'
gem 'phony_rails'
gem 'rack-timeout'
gem 'rails', '~> 4.1.0'
gem 'rails-assets-modular-scale'
gem 'rails-assets-time-elements'
gem 'recipient_interceptor'
gem 'sass-rails', '~> 4.0.3'
gem 'simple_form'
gem 'twilio-ruby'
gem 'uglifier'
gem 'unicorn'

group :development do
  gem 'foreman'
  gem 'spring'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0.0'
end

group :test do
  gem 'capybara-webkit', '>= 1.2.0'
  gem 'database_cleaner'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :staging, :production do
  gem 'newrelic_rpm', '>= 3.7.3'
  gem 'rails_12factor'
end
