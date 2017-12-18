ENV['RACK_ENV'] = 'test'
require 'orderly'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'
require './app/app'
require 'simplecov'
require 'simplecov-console'
require_relative 'web_helper'


Capybara.app = Chitter

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

   config.before(:each) do
     DatabaseCleaner.start
   end

   config.after(:each) do
     DatabaseCleaner.clean
   end
end
