source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '3.0.2'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'cucumber'
  gem 'rubocop-rspec'
  gem 'coveralls', require: false
  gem 'capybara'
end

group :development, :test do
  gem 'rubocop', '1.20'
end

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-flash'
gem 'bcrypt'
gem 'pg'
