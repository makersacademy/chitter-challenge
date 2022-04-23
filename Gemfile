source 'https://rubygems.org'

ruby '3.0.2'

gem 'webrick'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'capybara'
  gem 'timecop'
end

group :development, :test do
  gem 'rubocop', '1.20'
  gem 'sinatra'
  gem 'sinatra-contrib'
  gem 'pg'
end
