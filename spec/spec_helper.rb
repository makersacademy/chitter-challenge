ENV["RACK_ENV"] = "test"
require 'coveralls'
require 'simplecov'
SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require 'capybara'
require 'capybara/rspec'
require 'rspec/sinatra'
require 'rspec'
require './app/app'
require 'database_cleaner'
require 'features/web_helper'

Capybara.app = Chitter

RSpec.configure do |config|
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # config.disable_monkey_patching!
  # config.warnings = true
  #
  # if config.files_to_run.one?
  #   config.default_formatter = 'doc'
  # end
  #
  # config.profile_examples = 10
  # config.order = :random
  # Kernel.srand config.seed
  #
  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :transaction
  #   DatabaseCleaner.clean_with(:truncation)
  # end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
