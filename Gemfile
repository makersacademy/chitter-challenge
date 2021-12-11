# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

  ruby '3.0.2'

# gem "rails'
  gem 'sinatra'
  gem 'sinatra-contrib'
  gem 'pg'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'rspec-sinatra'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development do
  gem 'rack'
end

group :development, :test do
  gem 'rubocop', '1.20'
end
