ENV['RACK_ENV'] = "test"

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

require "coveralls"
require "simplecov"
require "capybara/rspec"
require './app/app.rb'
require "database_cleaner"
require "factory_girl"
require_relative 'helpers/helpers'

Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

RSpec.configure do |config|
  
  config.include FactoryGirl::Syntax::Methods
  config.include Helpers
  config.include Timestamper

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