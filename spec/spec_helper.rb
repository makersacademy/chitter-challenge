ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
require 'capybara'
require 'rspec'
require 'capybara/rspec'
require './app/app'
require 'features/web_helpers'
require 'database_cleaner'
require 'timecop'

require_relative 'helpers/session'

RSpec.configure do |config|
  config.include SessionHelpers

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
Capybara.app = MessageInABottle

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
