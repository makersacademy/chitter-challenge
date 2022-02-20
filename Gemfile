source 'https://rubygems.org'

ruby '3.0.0'
git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }



gem 'pg'
gem 'sinatra'
gem "sinatra-contrib"
gem 'webrick'
gem 'sinatra-flash'
gem 'bcrypt'
gem 'actionview'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'orderly'
  gem 'rake'
end

group :development, :test do
  gem 'rubocop', '1.20'
end
