require_relative './setup_test_database'
# Setting the environment to 'test'
ENV['ENVIRONMENT'] = 'test'
# Bringing the content of the 'app.rb' file
require File.join(File.dirname(__FILE__), '..', 'app.rb')
# Requiring all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'
# Telling Capybara to talk to Chitter
Capybara.app = Chitter

require 'simplecov'
require 'simplecov-console'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.before(:each) do
    test_database
  end
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
