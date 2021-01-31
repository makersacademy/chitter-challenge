# Get the 'test_database_setup.rb' file which will clear the messages tables when used

require "./spec/setup_test_database"

# Set the environment to 'test'

ENV['ENVIRONMENT'] = 'test'

# Run 'test_database_setup.rb' before each test

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

# Bring in everything from 'app.rb'

require File.join(File.dirname(__FILE__), "..", "app.rb")

# Require testing gems

require "capybara"
require "capybara/rspec"
require "rspec"

# Tell Capybara to talk to Chitter (in 'app.rb')

Capybara.app = Chitter

# Default setup below

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end

