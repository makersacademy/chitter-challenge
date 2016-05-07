ENV["RACK_ENV"] = "test"

require './app/models/user'
require 'web_helper'
require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require './app/app'
Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
