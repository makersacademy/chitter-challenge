ENV['RACK_ENV'] = 'test'
require 'coveralls'
require 'simplecov'
require './app/server'
require 'database_cleaner'
require 'rspec'
require 'capybara/rspec'
require 'data_mapper'

Capybara.app = Sinatra::Application

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!




RSpec.configure do |config|


  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
