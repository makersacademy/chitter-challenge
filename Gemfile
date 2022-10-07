source 'https://rubygems.org'

gem 'pg'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'capybara'
gem 'webrick'

gem 'capybara', group: :test
gem 'rspec', group: :test

ruby '3.0.2'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
