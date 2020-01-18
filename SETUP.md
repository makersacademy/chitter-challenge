##Setup for app

#add gems and run bundle 
gem 'sinatra'
gem 'sinatra-flash'
gem 'bcrypt'
  gem 'cucumber'
  gem 'rspec'
  gem 'rubocop-rspec'
  gem 'rubocop', '0.71.0'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
  gem 'pg'
  gem 'capybara'
  gem 'coveralls', require: false

#ensure spec helper is set up properly
ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'rspec'
require 'capybara/rpsec'

#set up data bases for use using SQL Postgres


