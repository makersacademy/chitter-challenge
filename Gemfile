source 'https://rubygems.org'

ruby '2.5.1'

git_source(:github) {|repo_name| "https://github.com/#{repo_name}"}

gem 'rake'
gem 'rubocop', '0.56.0'
gem 'sinatra'
gem 'data_mapper'
gem 'dm-postgres-adapter'
gem 'pry'

group :test do
  gem 'database_cleaner'
  gem 'rspec'
  gem 'capybara'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
