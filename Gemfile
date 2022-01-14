source 'https://rubygems.org'

ruby '3.0.2'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end

group :web do
  gem 'sinatra'
  gem 'sinatra-contrib'
  gem 'rack'
end

group :db do
  gem 'pg'
end
