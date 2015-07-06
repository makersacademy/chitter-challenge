ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/chitter_app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './app/data_mapper_setup'
require 'database_cleaner'
require 'factory_girl'
require 'coveralls'
require 'simplecov'
require_relative './factories/user'
require_relative './helpers/session'

Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods

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

  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end