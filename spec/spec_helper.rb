require 'capybara/rspec'
require 'coveralls'
require 'database_cleaner'
require 'server'
require 'simplecov'

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

# need a database before getting into this
#   config.before(:suite) do
#     DatabaseCleaner.strategy = :transaction
#     DatabaseCleaner.clean_with(:truncation)
#   end

#   config.before(:each) do
#     DatabaseCleaner.start
#   end

#   config.after(:each) do
#     DatabaseCleaner.clean
#   end
end