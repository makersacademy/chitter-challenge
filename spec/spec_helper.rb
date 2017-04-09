ENV['RACK_ENV'] = 'test'
require './app/app.rb'
require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'features/web_helper'

Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
