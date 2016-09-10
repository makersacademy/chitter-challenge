ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'rack/test'
require './app/app.rb'
require './app/models/peep'

Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
