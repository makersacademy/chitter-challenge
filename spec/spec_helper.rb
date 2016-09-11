ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
require 'database_cleaner'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = Chitter
