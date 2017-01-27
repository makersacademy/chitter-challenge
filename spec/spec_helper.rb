require 'coveralls'
require 'simplecov'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'
require 'sinatra'
#require 'web_helper'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!


RSpec.configure do |config|


  config.before(:suite) do # <-- before entire test run
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do # <-- create a "save point" before each test
    DatabaseCleaner.start
  end

  config.after(:each) do # <-- after each individual test roll back to "save point"
    DatabaseCleaner.clean
  end


  config.include Capybara::DSL # good
  #config.include FactoryGirl::Syntax::Methods # sure
  #config.include TestHelpers # good
  #config.include ChitterHelpers # nooooooooooo

end
