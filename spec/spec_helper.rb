# Generated by rspec-sinatra. (2015-12-30 12:05:49 +0000)

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

require 'capybara'
require 'capybara/rspec'
require 'coveralls'
require 'database_cleaner'
require 'mailgun'
require 'pry-byebug'
require 'rspec'
require 'simplecov'
require 'timecop'

require_relative 'helpers/session'

SimpleCov.formatters = [ SimpleCov::Formatter::HTMLFormatter,
                         Coveralls::SimpleCov::Formatter ]
# Coveralls.wear!
SimpleCov.start

Capybara.app = ChitterChallenge

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include SessionHelpers

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  # DatabaseCleaner gem setup
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do |example|
    DatabaseCleaner.strategy = example.metadata[:js] ? :truncation : :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
