ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', './app/chitter.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'coveralls'
require 'database_cleaner'
require 'factory_girl'
require_relative '../app/chitter'
require_relative 'factories/user'
require_relative 'helpers/sessions'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = App::Chitter

RSpec.configure do |config|
  
  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
  config.include SessionsHelpers

  config.before(:suite) do
    begin
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      DatabaseCleaner.clean
    end
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
