ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/rspec'
require 'coveralls'
require 'database_cleaner'
require 'data_mapper'
require 'dm-timestamps'
require 'factory_girl'
require 'rspec'
require 'simplecov'
require 'timecop'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

# require './app/models/peep'
# require './app/models/user'

# require './app/app'
require_relative '../app/app.rb'

# require './app/data_mapper_setup'
# require_relative '../data_mapper_setup'

require 'factories/user'
require 'helpers/session'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

Capybara.app = Chitter

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods
  config.include SessionHelpers

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

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
