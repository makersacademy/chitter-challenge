ENV['RACK_ENV'] = 'test'

require './app/server'
require 'database_cleaner'
require 'capybara/rspec'

# Note you had to require 'capybara/rspec',
# not just 'capybara'

Capybara.app = Server


RSpec.configure do |config|

  # Make note of these methods

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

  # # # # # # # # # # # # # # #

end
