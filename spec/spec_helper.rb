require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require_relative '../app/app'
# require 'webdrivers/chromedriver'
require 'dotenv'
require_relative './feature/feature_helper'
require 'pg'

Dotenv.load
ENV['RACK_ENV'] = 'test'
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

  # config.before(:each) do
  #   fill_urls
  # end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
