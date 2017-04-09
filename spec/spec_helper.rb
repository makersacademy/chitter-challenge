ENV['RACK_ENV']= "test"

require File.join(File.dirname(__FILE__), '..', './app.rb')

require 'capybara' # Add in
require 'capybara/rspec'
require 'rspec'
require 'coveralls'
require 'simplecov'
require 'database_cleaner'

require './models/user'
require './models/peep'
require './app'
require_relative 'helpers/session'

RSpec.configure do |config|

  config.include SessionHelpers

end


Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!


RSpec.configure do |config|
  # Everything in this block runs once before all the tests run
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # Everything in this block runs once before each individual test
  config.before(:each) do
    DatabaseCleaner.start
  end

  # Everything in this block runs once after each individual test
  config.after(:each) do
    DatabaseCleaner.clean
  end

end
