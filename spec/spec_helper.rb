require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require './app/data_mapper_setup'
require './app/app'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = App

ENV['RACK_ENV'] = 'test'
