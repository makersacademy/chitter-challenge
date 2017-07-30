ENV["RACK_ENV"] = "test"

require 'simplecov'
require 'simplecov-console'
require 'capybara/rspec'
require './app/models/peep'
require 'database_cleaner'
require_relative 'helpers/peeps'
require_relative 'helpers/session'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')
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

  config.include PeepsHelpers
  config.include SessionHelpers
end
