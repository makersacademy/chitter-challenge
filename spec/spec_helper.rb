require 'simplecov'
require 'simplecov-console'
require_relative './setup_database'
require 'features/helpers'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.add_filter do |src_file|
  File.basename(src_file.filename) == 'Rakefile'
end

SimpleCov.add_filter do |src_file|
  File.basename(src_file.filename) == 'database_connection_setup.rb'
end

SimpleCov.start

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
