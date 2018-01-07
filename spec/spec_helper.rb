ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

require 'database_cleaner'

require './app/app.rb'
require 'helpers/web_helper'

Capybara.app = Chitter


#  SimpleCov Configuration

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  # We require the webhelper module at the top and then include in the
  # RSpec configuration
      config.include SessionHelpers

  #  Database Cleaner Setup
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


  #  Rubocop Setup
      config.after(:suite) do
        puts
        puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
        puts "\e[33mTry it now! Just run: rubocop\e[0m"
      end

  #  RSpec Expectations Configs
      config.expect_with :rspec do |expectations|
        expectations.include_chain_clauses_in_custom_matcher_descriptions = true
      end

  #  RSpec Mocks Configs
      config.mock_with :rspec do |mocks|
        mocks.verify_partial_doubles = true
      end

  #  Backward Compatibility with RSpec 3
      config.shared_context_metadata_behavior = :apply_to_host_groups
end
