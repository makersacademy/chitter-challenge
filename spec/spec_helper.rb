require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require_relative '../app/app.rb'

Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
