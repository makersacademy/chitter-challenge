source 'https://rubygems.org'

ruby '3.0.1'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'thin'
gem 'foreman'
gem 'pg'

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
