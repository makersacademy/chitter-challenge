require 'coveralls'
require 'simplecov'
require 'web_helpers'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'
require 'factory_girl'

ENV['RACK_ENV'] = 'test'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

DatabaseCleaner.strategy = :truncation

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

Capybara.app = ChitterManager

RSpec.configure do |config|

  config.include Capybara::DSL
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
