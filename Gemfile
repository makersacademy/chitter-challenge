source 'https://rubygems.org'

ruby '2.6.5'

group :development, :production do
  gem 'sinatra-flash'
end

group :test, :development, :production do
  gem 'bcrypt'
  gem 'pg'
  gem 'puma'
  gem 'rack'
  gem 'rake'
  gem 'sinatra'
end

group :test, :development do
  gem 'rubocop-rake', require: false
  gem 'rubocop-rspec', require: false
end

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'rubocop', '0.79.0'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
