require 'coveralls'
require 'simplecov'
require 'capybara'
require 'rspec'
require 'capybara/rspec'
require 'database_cleaner'

# require './app/models/owl'
# require './app/models/twit'
require './app/app'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
