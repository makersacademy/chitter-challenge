ENV['RACK_ENV'] = "test"

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

require 'coveralls'
require 'simplecov'
require 'capybara'
require 'capybara/rspec'
require './app/models/user'
require './app/app'
require 'database_cleaner'
require 'feature/web_helpers'
require 'sinatra/flash'
require 'data_mapper'

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
