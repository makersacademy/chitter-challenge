ENV['RACK_ENV'] = 'test'

require 'database_cleaner'
require 'coveralls'
require 'simplecov'
require 'web_helper'
require 'capybara/rspec'
require './app/app'


SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

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

  # config.append_after(:each) do
  #   DatabaseCleaner.clean
  # end


end
