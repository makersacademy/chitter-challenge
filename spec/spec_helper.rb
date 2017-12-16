ENV['RACK_ENV'] = 'test'
require 'simplecov'
require 'simplecov-console'
require './app/chitter.rb'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require_relative 'features/web_helper'
require 'rspec'
require 'database_cleaner'
Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    # puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    # puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
