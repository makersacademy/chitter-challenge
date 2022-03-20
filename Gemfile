source 'https://rubygems.org'

ruby '3.0.2'

gem 'pg'
gem 'rack'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'webrick'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'webdrivers', '~> 5.0', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
