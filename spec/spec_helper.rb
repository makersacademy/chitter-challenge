require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

ENV['RACK_ENV'] = 'test'

require './app/app'
require './app/data_mapper_setup'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec'
require_relative 'support/helpers/web_helpers'

Capybara.app = Chitter

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include WebHelpers

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
