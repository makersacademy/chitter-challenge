ENV['RACK_ENV'] = 'test'

require './app/chitter.rb'
require './app/models/user.rb'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'dm-rspec'
require 'orderly'
require 'rack_session_access/capybara'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

Capybara.app = Chitter

def session
  last_request.env['rack.session']
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
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

  config.include(DataMapper::Matchers)

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop?\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
