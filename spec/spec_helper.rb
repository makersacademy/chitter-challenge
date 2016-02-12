require 'capybara/rspec'
require 'coveralls'
require 'simplecov'

require './app/models/message'
require './app/app'

Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
