require_relative '../lib/app.rb'
require_relative 'setup_test_database'
require_relative 'database_helpers'

# Set the environment to "test"
ENV['ENVIRONMENT'] = 'test'

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'

# Generate test coverage statistics
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
])
SimpleCov.start

# Tell Capybara to talk to TwitterClone
Capybara.app = TwitterClone

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
