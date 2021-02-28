source 'https://rubygems.org'

ruby '2.7.2'

group :development, :production do
  gem 'bcrypt'
  gem 'pg'
  gem 'puma'
  gem 'rack'
  gem 'sinatra'
  gem 'sinatra-flash'
end

group :test, :development, :production do
  gem 'rake'
end

group :test do
  gem 'capybara'
  gem 'coveralls_reborn', '~> 0.20.0', require: false
  gem 'rspec'
  gem 'rubocop', '0.79.0'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
