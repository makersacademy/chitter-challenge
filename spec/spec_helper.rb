ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

require 'capybara'
require 'capybara/rspec'
require 'coveralls'
require 'simplecov'
require 'database_cleaner'
require 'rspec'
require 'database_cleaner'
require 'features/web_helpers.rb'
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
