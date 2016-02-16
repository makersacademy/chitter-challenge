require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require './app/models/peep'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
