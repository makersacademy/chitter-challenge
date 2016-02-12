

ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', './app/app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.default_driver = :rake_test
Capybara.app = Chitter

RSpec.configure do |config|
  
#  config.before(:suite) do
#      DatabaseCleaner.strategy = :transaction
#      DatabaseCleaner.clean_with(:truncation)
#    end
#
#    config.around(:each) do |example|
#      DatabaseCleaner.cleaning do
#        example.run
#      end
#    end
    
  config.include Capybara::DSL
 
  config.expect_with :rspec do |expectations|
    
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

 
  config.mock_with :rspec do |mocks|
   
    mocks.verify_partial_doubles = true
  end


end
