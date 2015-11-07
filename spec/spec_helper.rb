require 'coveralls'
require 'simplecov'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'data_mapper'
# require 'web_helper'
require 'database_cleaner'
require File.join(File.dirname(__FILE__), '..', 'app/app.rb')


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

#Setup for Database rollback between test example instances
  # config.before(:suite) do
  #   DatabaseCleaner.clean_with :truncation
  #   DatabaseCleaner.strategy = :transaction
  # end
  # config.around(:each) do |example|
  #   DatabaseCleaner.start
  #   example.run
  #   DatabaseCleaner.clean
  # end

end
