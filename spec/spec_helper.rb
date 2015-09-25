ENV['RACK_ENV'] = 'test'
require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require './app/app'
require './app/data_mapper_setup'
require 'database_cleaner'

Capybara.app = App

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
