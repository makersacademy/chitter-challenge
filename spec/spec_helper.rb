require './spec/test_helper'
require './lib/db_connection'
require './spec/database_helper'
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require './app'
require 'pg'
require 'bcrypt'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV['ENVIRONMENT'] = 'test'

Capybara.app = ChitterApp
  
RSpec.configure do |config|

  config.before(:each) do
    truncate
    setup_users_table
    setup_peeps_table
    setup_tags_table
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
