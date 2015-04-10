ENV['RACK_ENV'] = 'test'

require 'database_cleaner'
require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require './lib/chitter'
require 'user_helpers'
include User_Helpers


SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

Capybara.app = Chitter

RSpec.configure do |config|

  config.before(:each) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.start
    DatabaseCleaner.clean
  end

end
