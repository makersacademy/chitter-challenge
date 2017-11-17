ENV['RACK_ENV'] = 'test'

require_relative '../app/app'
require_relative 'features/web_helpers'

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
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])

SimpleCov.start
