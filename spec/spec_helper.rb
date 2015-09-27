require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require_relative '../app/data_mapper_setup'
require_relative '../app/app'
require 'database_cleaner'

Capybara.app = Chitter

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

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
