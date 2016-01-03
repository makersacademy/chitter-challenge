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
require File.join(File.dirname(__FILE__), '..', 'app/app.rb')
Capybara.app = Chitter
