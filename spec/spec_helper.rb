ENV['RACK_ENV'] = 'test'

require_relative '../app/app'
require_relative '../app/data_mapper_setup'

require 'capybara'
require 'capybara/rspec'
require 'data_mapper'
require 'database_cleaner'
require 'simplecov'
require 'simplecov-console'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:suite) do
    include DataMapperSetup
    data_mapper_setup

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
