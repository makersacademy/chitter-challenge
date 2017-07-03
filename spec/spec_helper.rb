ENV['RACK_ENV'] = 'test'
require './app/app'
require './app/models/peep'
require './app/models/user'

require 'capybara'
require 'capybara/rspec'
require 'rspec'

require 'database_cleaner'
require 'timecop'

require 'simplecov'
require 'simplecov-console'

require_relative 'helpers/sessions'
require_relative 'helpers/users'

Capybara.app = Chitter



SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include SessionHelpers
  config.include UsersHelpers

end
