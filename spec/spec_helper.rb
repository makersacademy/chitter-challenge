ENV['RACK_ENV'] = 'test'

require './app/app.rb'
require 'helpers'

require 'coveralls'
require 'simplecov'
require 'database_cleaner'
require 'capybara/rspec'
require 'orderly'
require 'timecop'

Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

RSpec.configure do |config|
  config.include Capybara::DSL

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
