ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')
# FOR RACK APPLICATION TO WORK, REQUIRE THE SERVER FILE^^

require 'capybara/rspec'
require 'coveralls'
require 'database_cleaner'
require 'factory_girl'
require 'simplecov'

require './app/data_mapper_setup'
require_relative './helpers/session'

Capybara.app = Chitter
# NEED THIS LINE WHEN ERROR SAYS RACK-TEST REQUIRES A RACK APPLICATION BUT NONE WAS GIVEN.

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

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
