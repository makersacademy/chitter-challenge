require 'simplecov'
require 'simplecov-console'
require_relative 'setup_test_database'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start


# Set the environment to "test"
ENV['RACK_ENV'] = 'test'

# Bring in the contents of the `app.rb` file
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'

# Tell Capybara to talk to ChitterChallenge
Capybara.app = ChitterChallenge

# Every time RSPEC is run, call method setup_test_database
RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end
