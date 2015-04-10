ENV['RACK_ENV'] = 'test'
require './server.rb'
require 'database_cleaner'
require 'capybara/rspec'
require 'coveralls'
require 'simplecov'

Capybara.app = ChitterChatter

SimpleCov.start
