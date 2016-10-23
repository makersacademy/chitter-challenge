require "coveralls"
require "simplecov"

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

ENV["RACK_ENV"] = "test"

require File.join(File.dirname(__FILE__), "..", "app", "app")
require "capybara"
require "capybara/rspec"
require "dm-rspec"
require "database_cleaner"

Capybara.app = ChitterApp


RSpec.configure do |config|
  config.include(DataMapper::Matchers)

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
