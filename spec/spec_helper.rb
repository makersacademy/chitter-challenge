ENV['RACK_ENV'] = 'test'

require_relative '../app/app'

require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'simplecov'
require 'simplecov-console'
require 'selenium-webdriver'

Capybara.default_driver = :selenium
Capybara.app = App

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

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])

SimpleCov.start
