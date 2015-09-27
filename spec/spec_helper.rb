ENV['RACK_ENV'] = 'test'
require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require './app/data_mapper_setup'
require './app/app'
require 'database_cleaner'
require 'factory_girl'
require './spec/factories/user'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = Chitter

  RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods

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
