ENV['RACK_ENV'] ||= 'test'

require './app'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require 'web_helpers'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  # config.before(:suite) do
    # DatabaseCleaner.strategy = :transaction
    # DatabaseCleaner.clean_with(:truncation)
  # end

  config.around(:each) do |test|
    DatabaseCleaner.cleaning do
      test.run
    end
  end
end
