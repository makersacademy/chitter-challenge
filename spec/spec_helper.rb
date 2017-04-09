ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
require 'capybara'
require 'rspec'
require 'capybara/rspec'
require './app/app'
require 'features/web_helpers'

Capybara.app = MessageInABottle

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
