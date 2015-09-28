require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
# SimpleCov.start
ENV['RACK_ENV'] = 'test'
require 'capybara/rspec'
require './app/app'
require './app/data_mapper_setup'
require 'database_cleaner'
require 'factory_girl'
require 'byebug'
require_relative 'helpers/session'
require_relative 'helpers/peep'

FactoryGirl.find_definitions
Capybara.app = App



RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include SessionHelpers

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
