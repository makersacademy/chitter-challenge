ENV['RACK_ENV'] = 'test'

require './app/server'
require 'capybara/rspec'
require 'database_cleaner'
require 'data_mapper'

Capybara.app = Chitter

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.before(:each) do
    DatabaseCleaner.clean
  end
end
