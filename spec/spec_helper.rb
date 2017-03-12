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
require './app/models/user'
require_relative './feature/web_helpers'

Capybara.app = Chitter
