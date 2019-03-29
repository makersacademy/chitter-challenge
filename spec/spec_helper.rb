require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

#add below

#Capybara set up:

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'

Capybara.app = Chitter

# clears chitter_manager_test before each test
require_relative './setup_test_database.rb'

ENV['ENVIRONMENT'] = 'test'

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end



RSpec.configure do |config|
  config.after(:suite) do
    puts "\e[33mRun rubocop\e[0m"
  end
end
