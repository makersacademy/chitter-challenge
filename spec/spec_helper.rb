ENV["RACK_ENV"] ||= 'test'

# Coverall Setup
require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

# Gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'


# Files
require './app/models/peep'
require './app/models/user'

require_relative './helpers/user'
require_relative '../app/data_mapper_setup'


Capybara.app = Chitter

RSpec.configure do |config|

  config.include UserHelpers

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
  #     --seed 1234
  # config.order = :random
  # Kernel.srand config.seed
end
