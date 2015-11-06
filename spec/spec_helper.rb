
require 'coveralls'
require 'simplecov'
require './app/models/user'
require 'web_helpers'
require 'capybara/rspec'



SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
