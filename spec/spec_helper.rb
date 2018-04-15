ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require(File.join(File.dirname(__FILE__), '..', 'app.rb'))

require "capybara"
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
require 'rake'
require 'rspec'
# require_relative './features/web_helpers'
Rake.application.load_rakefile

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
   # require_relative './test_database_setup'
   Rake::Task['test_database_setup'].execute
   end
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
