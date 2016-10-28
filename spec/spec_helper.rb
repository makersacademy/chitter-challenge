ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

require 'coveralls'
require 'simplecov'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require './app/models/user.rb'
require 'database_cleaner'
require 'features/web_helper'
require 'data_mapper'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = Chitter

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include SessionHelpers

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
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

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
