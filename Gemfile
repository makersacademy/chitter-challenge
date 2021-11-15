source 'https://rubygems.org'

ruby '3.0.2'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'capybara'
gem 'sinatra-contrib'
gem 'webrick'
gem 'rubocop', '1.20'
gem 'pg'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
