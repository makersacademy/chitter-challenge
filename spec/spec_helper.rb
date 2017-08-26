ENV['RACK_ENV'] = 'test'

require 'simplecov'
require 'simplecov-console'
require 'database_cleaner'
require 'data_mapper'

#SimpleCov enable report
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

#DataMapper print report
DataMapper::Logger.new(STDOUT, :debug, '[DataMapper] ')
DataMapper::Model.raise_on_save_failure = true

# Capybara init
require File.join(File.dirname(__FILE__), '../app/app.rb')
Capybara.app = BookmarkManager

# Rspec config
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

end
