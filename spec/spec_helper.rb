require_relative './setup_test_database'

# setting environment variable 'ENVIRONMENT' to test when rspec is running

ENV['ENVIRONMENT'] = 'test'

# setting up test database

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end
end

# simple cov setup

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

# Requiring the Sinatra app file, capybara, capybara/rspec and rspec
require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'capybara'
require 'rspec'
require 'capybara/rspec'

# Telling capybara about my app class
Capybara.app = Chitter

# Requiring web helpers file
require File.join(File.dirname(__FILE__), './features', 'web_helpers.rb')
