ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'dm-timestamps'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require './app/app'
require './app/models/peep'

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
