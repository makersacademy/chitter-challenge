require 'coveralls'
require 'simplecov'
require 'capybara/rspec'

require_relative '../app/chitter'

Capybara.app = Chitter




SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
