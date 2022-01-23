source 'https://rubygems.org'

ruby '3.0.2'

source 'https://rubygems.org'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-flash'
gem 'sinatra-partial'
gem 'pg'
gem 'selenium-webdriver'
gem 'bcrypt'
gem 'rake'
gem 'rack'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'rubocop-rspec'
  gem 'capybara'
end

group :development, :test do
  gem 'rubocop', '1.20'
end

gem "puma", "~> 5.5"
