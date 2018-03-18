require 'simplecov'
require 'simplecov-console'
require 'app.rb'
require 'capybara'
require 'capybara/rspec'
require 'rake'

Capybara.app = Chitter
ENV['RACK_ENV'] = 'test'
Rake.application.load_rakefile

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['test_database_setup'].execute
  end
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end
