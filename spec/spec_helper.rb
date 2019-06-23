require 'data_mapper'

ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
# require_relative './test_db'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
#  config.before(:each) do
#    DataMapper.setup(:default, "postgres://localhost/chitter_test")
#    DataMapper.finalize
#    DataMapper.auto_migrate!
#  end
  
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.after(:suite) do
    puts
  end
end
