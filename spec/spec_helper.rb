ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'factory_girl'
require 'byebug'
require 'database_cleaner'

require './app/app.rb'
require './app/data_mapper_setup'

Capybara.app = Chitter

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods

  config.before(:suite) do
    DatabaseCleaner.clean_with :truncation
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
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
