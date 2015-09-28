ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'factory_girl'
require 'tilt/erb'

require_relative 'factories'
require_relative 'test_helpers'

Capybara.app = ChitterApp

RSpec.configure do |config|

  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
  config.include ChitterHelpers
  config.include TestHelpers

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

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
