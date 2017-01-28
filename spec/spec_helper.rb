require 'coveralls'
require 'simplecov'

require 'capybara/rspec'
require './app/app'
require_relative 'web_helpers'
require 'database_cleaner'
Capybara.app = ChitterApp

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
