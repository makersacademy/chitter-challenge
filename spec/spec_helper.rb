require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'rake'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

ENV['RACK_ENV'] = 'test'

# Bring in the contents of the `app.rb` file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Require all the testing gems


Rake.application.load_rakefile

# Tell Capybara to talk to BookmarkManager
Capybara.app = Chitter

RSpec.configure do |config|
  config.before(:each) do
    Rake::Task['setup_test_database'].execute
  end

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running away? It will be fun!\e[0m"
    puts "\e[33mTry it now! Just run!\e[0m"
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

end
