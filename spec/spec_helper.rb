ENV['DATABASE_URL'] = 'postgres://localhost/chitter_test'
require_relative 'helpers/session'

require 'data_mapper'
require 'tilt/erb'
require 'timecop'
require 'factory_girl'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'
require 'coveralls'

require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

Coveralls.wear!
Capybara.app = Chitter

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include SessionHelpers
  config.before(:all) do FactoryGirl.reload end
  config.include FactoryGirl::Syntax::Methods
  config.include Capybara::DSL

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
