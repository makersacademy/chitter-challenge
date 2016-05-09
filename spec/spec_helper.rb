ENV["RACK_ENV"] = "test"

require 'capybara/rspec'
require 'coveralls'
require 'simplecov'
require 'features/web_helper'
require 'database_cleaner'
require './app/app'
require './app/models/user'

Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

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
