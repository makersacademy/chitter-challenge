source 'https://rubygems.org'

ruby '2.7.2'

group :development, :production do
  gem 'puma'
  gem 'sinatra'
end

group :test, :development, :production do
  gem 'bcrypt'
  gem 'rack'
  gem 'pg'
end

group :test, :development do
  gem 'rake'
end

group :test do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'rspec'
  gem 'rubocop', '0.79.0'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
