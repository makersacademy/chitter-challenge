# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

gem 'sinatra'
gem 'pg'
gem 'rake'
gem 'bcrypt'
gem 'sinatra-flash'
gem 'mail'

group :test, :development do
  gem 'rspec'
  gem 'capybara'
  gem 'rubocop'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-nav'
end
