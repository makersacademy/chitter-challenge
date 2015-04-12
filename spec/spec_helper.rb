ENV['RACK_ENV'] = 'test'
require 'coveralls'
require 'simplecov'
require 'database_cleaner'
require 'capybara/rspec'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!


require './app/server'

Capybara.app = Chitter

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