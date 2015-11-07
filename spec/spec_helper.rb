require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear! 

ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'web_helper'
require './app/app'
require 'database_cleaner'

Capybara.app = Chitter

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end
  
  config.around(:each) do |example| 
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
