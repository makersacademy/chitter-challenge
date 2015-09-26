ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'coveralls'
require 'database_cleaner'
require 'factory_girl'
require 'simplecov'
require './spec/factories/user.rb'
require './app/app.rb'
require './app/data_mapper_setup.rb'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]

Capybara.app = Chitter
Coveralls.wear!


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
