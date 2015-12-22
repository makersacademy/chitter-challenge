require 'coveralls'
require 'simplecov'
require 'database_cleaner'
require 'web_helper'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!


ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/chitter.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = Chitter

RSpec.configure do |config|
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do |example|
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
