source 'https://rubygems.org'

ruby '3.0.2'

gem 'sinatra'
gem 'sinatra-contrib'

group :test do
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'rspec'
  gem 'capybara'
end

group :development, :test do
  gem 'rubocop', '1.20'
end

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

gem 'webrick', '~> 1.3', '>= 1.3.1'
gem 'pg', '~> 0.18.4'
