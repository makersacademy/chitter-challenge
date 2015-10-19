require 'coveralls'
require 'simplecov'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
# Coveralls.wear!
SimpleCov.start

ENV['RACK_ENV'] = 'test'

require 'capybara/rspec'
require 'data_mapper'
require './app/helpers/session_user'
require 'database_cleaner'
require 'factory_girl'
require './app/chitter_web'
require './app/data_mapper_setup'
require './spec/factories/user'


Capybara.app = ChitterApp::Chitter

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods
  config.include SessionUser

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
