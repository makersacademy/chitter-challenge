require 'coveralls'
ENV['RACK_ENV'] = 'test'


require 'simplecov'
require './app/server'
require 'capybara/rspec'
require 'database_cleaner'
require 'byebug'


DataMapper.auto_migrate!

# E' giusto fare la migrazione all'interno del test?

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!



Capybara.app = Sinatra::Application.new


RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end



end
