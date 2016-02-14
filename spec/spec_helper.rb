SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear! 

Capybara.app = Chitter

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec'
require 'web_helper.rb'
require 'coveralls'
require 'simplecov'

RSpec.configure do |config|
  config.include Capybara::DSL
  
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

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
