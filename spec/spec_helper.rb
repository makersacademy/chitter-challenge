require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'rspec'
require 'database_cleaner'
require 'capybara'
require 'factory_girl'
require_relative 'helpers/session'
require_relative 'helpers/peep'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/server.rb')

Capybara.app = Turing::Chitter

# require File.join(File.dirname(__FILE__), '..', 'app/models/user.rb')

RSpec.configure do |config|

  config.include SessionHelpers
  config.include PeepHelpers
  
  config.expect_with :rspec do |expectations|
   
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.include FactoryGirl::Syntax::Methods

  FactoryGirl.definition_file_paths = %w{./factories ./spec/factories}
  FactoryGirl.find_definitions

  

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end


end
