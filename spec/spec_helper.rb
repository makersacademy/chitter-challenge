require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require_relative './setup_test_database'
# require 'database_cleaner'
require 'rspec'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

# Set the environment to "test"
ENV['ENVIRONMENT'] = 'test'

# Bring in the contents of the `app.rb` file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Tell Capybara to talk to BookmarkManager
Capybara.app = ChitterApp

# For accurate test coverage measurements, require your code AFTER 'SimpleCov.start'

RSpec.configure do |config|
  config.include Capybara::DSL
  
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

  config.before(:each) do
    setup_test_database
  end

  # config.before(:suite) do # <-- before entire test run
  #   DatabaseCleaner.strategy = :transaction
  #   DatabaseCleaner.clean_with(:truncation)
  # end

  # assertions if you prefer.
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # rspec-mocks config goes here. You can use an alternate test double
  # library (such as bogus or mocha) by changing the `mock_with` option here.
    config.mock_with :rspec do |mocks|
      config.mock_with :rspec do |mocks|
      # Prevents you from mocking or stubbing a method that does not exist on
      # a real object. This is generally recommended, and will default to
      # `true` in RSpec 4.
        mocks.verify_partial_doubles = true
      end
    end 
end