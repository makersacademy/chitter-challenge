ENV['RACK_ENV'] = 'test'

require './app/app.rb'
require './app/models/peep.rb'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'orderly'
require 'rspec'
require 'rubocop'
require 'simplecov'
require 'simplecov-console'
require 'sinatra'
require 'time'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end
