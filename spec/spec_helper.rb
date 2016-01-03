require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

ENV['RACK_ENV'] = 'test'
require 'database_cleaner'
require 'capybara/rspec'
require './app/models/peep'
require './app/models/user'
require './spec/web_helper.rb'
require File.join(File.dirname(__FILE__), '..', 'app/app.rb')
Capybara.app = Chitter
