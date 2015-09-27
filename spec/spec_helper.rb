require 'data_mapper'
ENV['RACK_ENV'] = 'test'

require_relative 'helpers/session'


require File.join(File.dirname(__FILE__), '..', 'app/app.rb')

require 'timecop'
require 'factory_girl'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'
require 'coveralls'

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

#------------------- Factory Girl

  config.before(:all) do FactoryGirl.reload end
  config.include FactoryGirl::Syntax::Methods

#------------------- Capybara

  config.include Capybara::DSL

#------------------- Database Cleaner

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
