ENV["RACK_ENV"] = 'test'

require_relative 'helpers/session'

require './app/models/nom'
require './app/models/user'
require './app/app'

require 'capybara'
require 'rspec'
require 'capybara/rspec'
require 'data_mapper'
require 'database_cleaner'

require 'coveralls'
require 'simplecov'

Capybara.app = NomDiaries

RSpec.configure do |config|

  config.include SessionHelpers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

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

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
