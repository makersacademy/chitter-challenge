require_relative './setup_database'

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require 'rake'

Rake.application.load_rakefile

require_relative '../app'

require 'sinatra'
require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) { Rake::Task['test_database_setup'].execute }

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
