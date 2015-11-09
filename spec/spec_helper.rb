require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'capybara'
require 'rspec'


SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
