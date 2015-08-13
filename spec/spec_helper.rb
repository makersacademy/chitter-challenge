# Generated by rspec-sinatra. (2015-08-13 18:47:54 +0100)
# All the comments were annoying me so I got rid of them :) - Josh

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'lib/chitter.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require "factory_girl"
require 'database_cleaner'

Capybara.app = Chitter

RSpec.configure do |config|
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  FactoryGirl.definition_file_paths = %w{./factories ./test/factories ./spec/factories}
  FactoryGirl.find_definitions
  config.include FactoryGirl::Syntax::Methods

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