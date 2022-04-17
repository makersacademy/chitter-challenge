source 'https://rubygems.org'

ruby '3.0.2'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'webrick'
gem 'pg'
gem 'launchy'
gem 'bcrypt'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  # gem 'orderly' Can't get this gem to work - although coverage in peep_spec
  gem 'capybara'
end

group :development, :test do
  gem 'rubocop', '1.20'
end
