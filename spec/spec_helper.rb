ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require 'rspec'
require 'capybara'
require 'capybara/rspec'
require './app/app'

Capybara.app = Chitter
