ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require_relative '../app/server'

Capybara.app = Sinatra::Application

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!


