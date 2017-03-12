ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
require 'web_helper'
require 'capybara/rspec'
require './app'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

SimpleCov.start

Capybara.app = Chitter
