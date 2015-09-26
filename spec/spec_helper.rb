require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require_relative '../app/data_mapper_setup'
require_relative '../app/app'

Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
