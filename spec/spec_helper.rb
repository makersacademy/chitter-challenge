#require setup_test_database method
require_relative './setup_test_database'
#set environment variable to test
ENV['ENVIRONMENT'] = 'test'
#before each RSpec test call the setup_test_database method to clear database
RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

require 'simplecov'
require 'simplecov-console'
require 'capybara'
require 'capybara/rspec'
require './app'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

Capybara.app = Chitter

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
