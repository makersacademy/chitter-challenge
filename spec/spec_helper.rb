ENV['RACK_ENV'] = 'test'
require './app/server'
require 'capybara/rspec'
require 'database_cleaner'

Capybara.app = Sinatra::Application


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
  
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
