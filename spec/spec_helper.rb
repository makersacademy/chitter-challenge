require 'simplecov'
require 'simplecov-console'
ENV['RACK_ENV'] = 'test'
require 'sinatra'
require 'capybara'
require 'rspec'
require 'capybara/rspec'
require 'data_mapper'
require 'dm-postgres-adapter'
require './app/models/peep'
require 'database_cleaner'
require 'time'
require 'web_helper'
require File.join(File.dirname(__FILE__), '..', './app/app.rb')
# require_relative 'web_helpers'
Capybara.app = ChitterChatter

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:transaction)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
