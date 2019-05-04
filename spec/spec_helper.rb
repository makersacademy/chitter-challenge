require 'simplecov'
require 'simplecov-console'
require 'rspec'
require 'capybara/rspec'
require_relative '../app'
require_relative './db_test_setup'

ENV['RACK_ENV'] = 'test'
ENV['ENVIRONMENT'] = 'test_database'
Capybara.app = Chitter

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
  config.example_status_persistence_file_path = './spec/failing_test.txt'

  config.before(:each) do
    DataBaseTestSetup.truncating
  end
end
