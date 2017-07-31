ENV['RACK_ENV'] = 'test'
require 'database_cleaner'
require 'simplecov'
require 'simplecov-console'
require 'rspec'
require 'orderly'
require 'capybara/rspec'
require_relative '../app/app.rb'
require_relative 'features/web_helpers'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/chitter_test')
DataMapper.finalize
DataMapper.auto_upgrade!

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each, type: :feature) do
    driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test
    unless driver_shares_db_connection_with_specs
      DatabaseCleaner.strategy = :truncation
    end
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end

end
