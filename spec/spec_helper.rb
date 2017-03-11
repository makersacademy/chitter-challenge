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

ENV['RACK_ENV'] = 'test'

Capybara.app = Chitter
