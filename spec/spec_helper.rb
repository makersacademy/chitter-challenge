ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require './app/chitter'
require './app/models/peep'
require 'capybara'
require 'rspec' 
require 'capybara/rspec'
require 'database_cleaner'

Capybara.app = Chitter

require_relative 'helpers/session'

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

