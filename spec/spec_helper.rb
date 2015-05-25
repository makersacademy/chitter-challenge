require 'coveralls'
require 'simplecov'

ENV['RACK_ENV'] = 'test'

require './app/chitter'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
