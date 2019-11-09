# require_relative './setup_test_database'
ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do|config|

  config.before(:suite) do
    DatabaseCleaner[:data_mapper].strategy = :transaction
    DatabaseCleaner[:data_mapper].clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner[:data_mapper].start
  end

  config.after(:each) do
    DatabaseCleaner[:data_mapper].clean
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocops\e[0m"
  end
end
