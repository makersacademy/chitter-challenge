require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative '../app/app'
require 'dotenv'
require_relative './feature/feature_helper'
require_relative '../db/queries/pg_connect'
require 'pg'

#Setup DB
include Postgres
ENV['ENVIRONMENT'] = 'test'
connect
Dotenv.load

Capybara.app = ChitterApp



SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

RSpec.configure do |config|
  
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:each) do |test|
    fill_data unless test.metadata[:store_connection]
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
