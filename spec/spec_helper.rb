require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'capybara'
require 'rspec'
require './app'
require 'features/web_helpers'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
