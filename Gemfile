source 'https://rubygems.org'

ruby '3.0.2'

gem 'sinatra'
gem 'pg', '~> 0.18.4'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'sinatra-reloader', '~> 1.0'
end

group :development, :test do
  gem 'rubocop', '1.20'
end
