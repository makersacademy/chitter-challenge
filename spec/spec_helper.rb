ENV["RACK_ENV"] = "test"
require 'sinatra'
require 'sinatra/flash'
require 'capybara'
require 'rspec'
require 'capybara/rspec'
require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/peep'
require 'database_cleaner'
require 'feature_tests/web_helpers'
# require 'sinatra-flash'
require File.join(File.dirname(__FILE__), '..', './app/app.rb')
Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:transaction)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
