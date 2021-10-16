source 'https://rubygems.org'

ruby '3.0.2'

gem 'pg'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-flash'
gem 'bcrypt'
# gem launchy

group :test do
  gem 'capybara', group: :test
  gem 'rspec'
  gem 'timecop'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
