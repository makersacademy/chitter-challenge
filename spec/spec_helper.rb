ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
require 'capybara'
require 'rspec'
require 'capybara/rspec'
require 'coveralls'
require 'database_cleaner'
require 'factory_girl'
require 'simplecov'
require 'tilt/erb'
require './app/chitter.rb'
require './app/data_mapper_setup.rb'
require './spec/helpers/test_helpers'


SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require File.join(File.dirname(__FILE__), '..', 'app/chitter.rb')

DataMapper.auto_migrate!

Capybara.app = Chitter

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include TestHelpers

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

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
