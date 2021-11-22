source 'https://rubygems.org'

ruby '3.0.2'

gem 'sinatra'
gem "selenium-webdriver"
gem 'rack'
gem 'pg'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'capybara'
end

group :development, :test do
  gem 'rubocop', '1.20'
  gem "sinatra-contrib"
end
