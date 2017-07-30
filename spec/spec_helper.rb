ENV["RACK_ENV"] = "test"
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require './app/models/peep'
require './app/app'

Capybara.app = Chitter
=begin
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
=end
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start
