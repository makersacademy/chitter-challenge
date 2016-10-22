ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'
require './app/app.rb'
require './app/models/peep'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = ChitterChallenge

RSpec.configure do |config|
  config.include Capybara::DSL

  config.before(:suite) do # Everything in this block runs once before all the tests run
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do # Everything in this block runs once before each individual test
    DatabaseCleaner.start
  end
  config.after(:each) do # Everything in this block runs once after each individual test
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10

  config.order = :random

  Kernel.srand config.seed

end
