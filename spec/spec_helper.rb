ENV['RACK_ENV'] ||= 'test'

require 'capybara/rspec'
require './app/app'
require 'database_cleaner'


Capybara.app = Chitter


# Begin DatabaseCleaner Code

RSpec.configure do |config|
  # Everything in this block runs once before all the tests run
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  # Everything in this block runs once before each individual test
  config.before(:each) do
    DatabaseCleaner.start
  end

  # Everything in this block runs once after each individual test
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

# End DatabaseCleaner Code
