ENV["RACK_ENV"] = "test"

require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require './app/app'
require 'database_cleaner'
require './app/models/peep'

require 'features/web_helper'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  # Everything in this block runs once before all the tests run
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  # Everything in this block runs once before each individual test
  config.before(:each) do
      DatabaseCleaner.start
  end

    # Everything in this block runs once after each individual test
  config.append_after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
