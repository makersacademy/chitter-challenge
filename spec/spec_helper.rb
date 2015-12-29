require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'web_helper'
require './app/app'
require './app/models/user'

Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
