ENV['RACK_ENV'] = "test"

require './app/app'

require 'capybara'
require 'capybara/rspec'
require 'coveralls'
require 'simplecov'
require 'database_cleaner'
require 'features/web_helpers'


SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = Chitter

RSpec.configure do |config|
	config.include Capybara::DSL

	config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end
