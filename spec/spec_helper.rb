ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'
require './app/models/user.rb'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!


require File.join(File.dirname(__FILE__), '..', '/app/app.rb')

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
