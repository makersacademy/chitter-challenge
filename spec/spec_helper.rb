

require File.join(File.dirname(__FILE__), '..', './app.rb')

require 'capybara' # Add in
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'
require 'coveralls'
require 'simplecov'


require './models/user'
require './models/peep'
require './app'
require_relative 'helpers/session'

ENV['RACK_ENV']= "test"

Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!


RSpec.configure do |config|

    config.include SessionHelpers
  # Everything in this block runs once before all the tests run
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
