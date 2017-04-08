ENV["RACK_ENV"] = 'test'

require './app/models/nom'
require './app/app'

require 'capybara'
require 'rspec'
require 'capybara/rspec'
require 'data_mapper'
require 'database_cleaner'

require 'coveralls'
require 'simplecov'

Capybara.app = NomDiaries

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


# Capybara.app = Nom
