ENV['RACK_ENV'] = 'test'
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require_relative '../app/data_mapper_setup'
require_relative '../app/app'
require 'signing_in_helper'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end
