ENV['RACK_ENV'] = 'test'
require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'database_cleaner'
# require 'data_mapper_setup'
require './app/server'
require './app/models/peep'
require './app/models/user'

Coveralls.wear!
Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

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
