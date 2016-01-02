ENV["RACK_ENV"] = "test"

require 'coveralls'
require 'simplecov'

require 'web_helper'
require 'capybara/rspec'
require './app/models/user'
require './app/app'
require 'database_cleaner'
require 'sinatra/flash'
Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

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
