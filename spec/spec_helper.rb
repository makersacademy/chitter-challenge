require 'coveralls'
require 'simplecov'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', './app/app.rb')

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = Chitter

RSpec.configure do |config|
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
  # This option will default to `true` in RSpec 4. It makes the `description`
  # and `failure_message` of custom matchers include text for helper methods
  # defined using `chain`, e.g.:
  # be_bigger_than(2).and_smaller_than(4).description
  #   # => "be bigger than 2 and smaller than 4"
  # ...rather than:
  #   # => "be bigger than 2"
  expectations.include_chain_clauses_in_custom_matcher_descriptions = true
end

config.mock_with :rspec do |mocks|
  # Prevents you from mocking or stubbing a method that does not exist on
  # a real object. This is generally recommended, and will default to
  # `true` in RSpec 4.
  mocks.verify_partial_doubles = true
end

config.before(:suite) do
  DatabaseCleaner.strategy = :transaction
  DatabaseCleaner.clean_with(:truncation)
end

# Everything in this block runs once before each individual test
config.before(:each) do
  DatabaseCleaner.start
end

# Everything in this block runs once after each individual test
config.after(:each) do
  DatabaseCleaner.clean
end

end
