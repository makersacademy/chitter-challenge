require 'capybara/rspec'
require './app/app'
require './app/models/user'
require 'rspec'

Capybara.app = Chitter
require 'coveralls'
require 'simplecov'


SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
