require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

ENV["RACK_ENV"] = "test"

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')
require 'capybara/rspec'
require 'database_cleaner'
require 'timecop'
require_relative 'helpers/session'
require './app/app'
require './app/models/user'

Capybara.app = Chitter

RSpec.configure do |config|

  config.include SessionHelpers
  config.include Capybara::DSL

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
