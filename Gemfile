source 'https://rubygems.org'

ruby '3.0.2'

gem 'sinatra'
gem 'sinatra-contrib'
gem "sinatra-flash"
gem 'rack'
gem 'webrick'
gem 'pg'
gem 'activerecord', '5.2'
gem 'sinatra-activerecord'
gem 'rake'
gem 'bcrypt'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end

group :development do
  gem 'shotgun'
  gem 'tux'
  gem 'sqlite3'
end
