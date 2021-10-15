source 'https://rubygems.org'

ruby '3.0.2'

gem 'pg'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-reloader'
gem 'webrick'
gem 'sinatra-flash'
gem 'bcrypt'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
  gem 'rubocop-rspec'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'timecop'
end
