ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app', 'app.rb')

require 'coveralls'
require 'simplecov'

require 'rspec'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

require './app/models/user'

Capybara.app = Chitter

# RSpec.configure do |config|
#   # config.before(:suite) do
#   #   DatabaseCleaner.strategy = :transaction
#   #   DatabaseCleaner.clean_with(:truncation)
#   # end

#   # config.before(:each) do
#   #   DatabaseCleaner.start
#   # end

#   # config.after(:each) do
#   #   DatabaseCleaner.clean
#   # end

#   config.include Capybara::DSL

#   config.expect_with :rspec do |expectations|
#     expectations.include_chain_clauses_in_custom_matcher_descriptions = true
#   end

#   config.mock_with :rspec do |mocks|
#     mocks.verify_partial_doubles = true
#   end

#   config.shared_context_metadata_behavior = :apply_to_host_groups
# end
