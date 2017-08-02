ENV["RACK_ENV"] = "test"
require 'database_cleaner'
require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require 'capybara'
require 'rspec'
require 'timecop'
require_relative '../app/data_mapper_setup.rb'
require_relative '../app/app.rb'
require_relative 'features/web_helper'

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
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

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start
