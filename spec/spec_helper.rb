ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', './app/chitter.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'coveralls'
require 'database_cleaner'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = Chitter

RSpec.configure do |config|
  
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # config.before(:suite) do #These two lines were problematic for Bex
  #   DatabaseCleaner.strategy = :transaction
  #   DatabaseCleaner.clean_with(:truncation)
  # end

  config.before(:each) do
    DatabaseCleaner.start
    DatabaseCleaner.clean
  end

end
