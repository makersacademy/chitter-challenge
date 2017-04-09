ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec'

# require './app/models/user'
require './app/app'

Capybara.app = Ricker

require 'coveralls'
require 'simplecov'

# SimpleCov.formatters = [
#   SimpleCov::Formatter::HTMLFormatter,
#   Coveralls::SimpleCov::Formatter
# ]
# Coveralls.wear!


# require 'simplecov'
# SimpleCov.start

require_relative 'helpers/session'
require_relative 'helpers/roll'

RSpec.configure do |config|

  config.include SessionHelpers
  config.include RollHelpers

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
