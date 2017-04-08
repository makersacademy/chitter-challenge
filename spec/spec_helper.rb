require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require 'capybara/rspec'
require_relative '../app/models/peep'
require_relative '../app/app'

Capybara.app = Chitter 
