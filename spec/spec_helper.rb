require 'simplecov'
require 'simplecov-console'

ENV["RACK_ENV"] = "test"

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require_relative "../app"
require "rspec"
require "capybara"
require "capybara/rspec"
require "rack/test"
require "orderly"
require 'database_cleaner/active_record'

Capybara.app = ChitterApplication

RSpec.configure do |config|
  config.before(:suite) do 
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
