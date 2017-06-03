ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
   SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

## Capybara
require File.join(File.dirname(__FILE__), '..', 'app/chitter.rb')
Capybara.app = Chitter

## DatabaseCleaner
RSpec.configure do |config|
  # this is run one time before running all the tests
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # this is run one time before each single test
  config.before(:each) do
    DatabaseCleaner.start
  end

  # this is run one time after each test
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
