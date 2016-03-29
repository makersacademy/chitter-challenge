ENV["RACK_ENV"] = "tests"

require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require './app/app'
require 'database_cleaner'
require 'features/web_helper.rb'


Capybara.app = Chitter

require File.join(File.dirname(__FILE__), '..', './app/app.rb')

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
