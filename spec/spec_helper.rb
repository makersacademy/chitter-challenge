require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'database_cleaner'
require_relative '../app/server.rb'

Capybara.app = Chitter

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|

  config.before :suite do
    DatabaseCleaner.clean_with :truncation
    DatabaseCleaner.strategy = :transaction
  end

  config.before :each do
    DatabaseCleaner.start
  end

  config.after :each do
    DatabaseCleaner.clean
  end

end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
