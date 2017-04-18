ENV["RACK_ENV"] = "test"

require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'database_cleaner'

require './app/app'
require './app/models/peep'
require_relative 'helpers/session'

Capybara.app = Chitter

RSpec.configure do |config|

  config.include SessionHelpers

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

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
