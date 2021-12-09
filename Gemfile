source 'https://rubygems.org'

ruby '3.0.1'

  gem 'sinatra'
  gem 'sinatra-contrib'
  gem 'pg'
  gem 'rack'
  gem 'webrick'
  gem 'bcrypt'
  gem 'htmlbeautifier'
  gem 'sinatra-flash'
  gem 'thin'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'capybara'
end

group :development, :test do
  gem 'rubocop', '1.20'
end

group :production do
  gem 'thin'  
end
