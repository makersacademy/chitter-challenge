require 'coveralls'
require 'simplecov'
require 'capybara'
require 'capybara/rspec'
require 'web_helper'
require './app/models/user'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
