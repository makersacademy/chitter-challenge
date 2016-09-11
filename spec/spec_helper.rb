ENV['RACK_ENV'] = 'test'

require 'database_cleaner'
require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'rack/test'
require './app/app.rb'
require './app/models/peep'
require_relative 'features/web_helpers'

Capybara.app = Chitter

RSpec.configure do |config|
  # Everything in this block runs once before all the tests run
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # Everything in this block runs once before each individual test
  config.before(:each) do
    DatabaseCleaner.start
  end

  # Everything in this block runs once after each individual test
  config.after(:each) do
    DatabaseCleaner.clean
  end

end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
