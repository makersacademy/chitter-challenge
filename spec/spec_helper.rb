ENV['RACK_ENV'] = 'test'

require_relative '../app/chitter'
# require 'database_cleaner'
require 'capybara/rspec'

Capybara.app = Chitter::Application


require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
