ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
require './server'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
