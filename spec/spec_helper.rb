ENV['RACK_ENV'] = 'test'

require_relative 'web_helper'
require 'database_cleaner'
require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require File.join(File.dirname(__FILE__), '../app', '/app.rb')

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start


Capybara.app = Chitter

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
