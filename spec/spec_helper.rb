require 'coveralls'
require 'simplecov'
require 'capybara/rspec'
require 'database_cleaner'
require 'factory_girl'
require 'dm-rspec'

require File.join(File.dirname(__FILE__), '../app/chitter_app.rb')
Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

RSpec.configure do |config|

  config.include(DataMapper::Matchers) #for dm-rspec gem
  
  config.include FactoryGirl::Syntax::Methods 
  FactoryGirl.definition_file_paths = %w{./spec/factories}
  FactoryGirl.find_definitions

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

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
