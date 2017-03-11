ENV["RACK_ENV"] = 'test'

require File.join(File.dirname(__FILE__), '..', './app/app.rb')

require 'coveralls'
require 'simplecov'
require 'capybara/rspec'

require './app/models/user'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = Chitter
