require_relative '../app/app'
require './app/models/user'
require 'capybara/rspec'
require 'coveralls'
require 'simplecov'
require 'features/web_helpers'

Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
