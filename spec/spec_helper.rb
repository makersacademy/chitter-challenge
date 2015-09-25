require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'database_cleaner'
require_relative '../app/app.rb'
require 'byebug'
require_relative 'helpers/session'

Capybara.app = Chitter

RSpec.configure do |config|

  config.include SessionHelpers

end

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

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

end
