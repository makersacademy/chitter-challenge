# Set up test environment for databases
ENV['ENVIRONMENT'] = 'test'

# required gems
require_relative 'clear_test_database'
require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'

# require controller file
require_relative '../app'

# # set rack environment
# ENV['RACK_ENV'] = 'test'

# Tell capybara to talk to Chitter
Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    clear_test_database
  end
end
