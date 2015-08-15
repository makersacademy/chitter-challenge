require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require File.join(File.dirname(__FILE__), '..', 'app/app.rb')
require_relative'../app/app.rb'
require_relative '../app/models/peep'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = Chitter
