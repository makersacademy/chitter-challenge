source 'https://rubygems.org'

ruby '3.0.2'

gem 'sinatra'
gem 'sinatra-flash'
gem 'webrick'
gem 'pg'
gem 'bcrypt'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'capybara'
  gem 'launchy'
end

group :development, :test do
  gem 'rubocop', '1.20'
  gem 'sinatra-contrib'
end
