ENV["RACK_ENV"] = "test"

require File.join(File.dirname(__FILE__), '..', 'app', 'app.rb')

require 'coveralls'
require 'simplecov'

require 'capybara/rspec'
require 'capybara/poltergeist'
require 'database_cleaner'

require 'web_helper'

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

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
  
  Capybara.configure do |c|
    c.javascript_driver = :poltergeist
    c.default_driver = :poltergeist
  end
  
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end
  
  config.before(:each) do
    DatabaseCleaner.start
  end
  
  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end
