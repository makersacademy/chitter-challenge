ENV['RACK_ENV'] = 'test'
require './app/app.rb'
require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'features/web_helper'
require 'database_cleaner'

Capybara.app = Chitter

RSpec.configure do |config|

  config.before(:each) do
    DataMapper.setup(:default, "postgres://localhost/chitter_test")
  end

  config.after(:each) do
    DataMapper.setup(:default, "postgres://localhost/chitter_development")
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
