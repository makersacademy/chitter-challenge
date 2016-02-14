
ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

require_relative '../app/app'
require 'coveralls'
require 'simplecov'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'
require 'bcrypt'
require_relative '../data_mapper_setup'

Capybara.app = ChitterChallenge

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # DATABASE CLEANER
  # Everything in this block runs once before all the tests run

  # Everything in this block runs once before each individual test
  config.before(:each) do
    DatabaseCleaner.start
  end

  # Everything in this block runs once after each individual test
  config.after(:each) do
    DatabaseCleaner.clean
  end

end
