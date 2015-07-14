ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/chitter.rb')

require './app/models/user'
require './app/models/peep'
require './datamapper_setup'

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'
require 'factory_girl'
require 'timecop'
require_relative './factory/user'
require_relative './factory/peep'
require_relative './helpers/session'
require_relative './helpers/post_peep'

Capybara.app = App

RSpec.configure do |config|

  config.include FactoryGirl::Syntax::Methods

  config.include SessionHelpers
  config.include PostPeepHelpers

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

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
