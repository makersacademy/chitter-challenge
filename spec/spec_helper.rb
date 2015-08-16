require 'database_cleaner'
require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'helpers/user'
require 'helpers/peep'
require 'orderly'
require_relative '../app/app.rb'
Capybara.app = Chitter

RSpec.configure do |config|

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

  config.include UserHelpers
  config.include PeepHelpers

end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!
