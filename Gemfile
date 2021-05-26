# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

ruby '2.6.5'

gem 'bcrypt'
gem 'pg', '~> 1.2', '>= 1.2.3'
gem 'rubocop'
gem 'rubocop-rspec'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-flash'

group :test do
  gem 'capybara'
  gem 'coveralls', require: false
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
