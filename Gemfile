source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '2.6.5'

gem 'pg'
gem 'rack'
gem 'rake'
gem 'sinatra'

group :test, :development do
  gem 'capybara'
  gem 'rspec'
  gem 'rubocop', '0.71.0'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
