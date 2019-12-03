ENV['ENVIRONMENT'] = 'test'
require_relative './setup_test_database'
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require './database_connection_setup'

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
    config.before(:each) do
    'setup_test_database'
  end
end

SimpleCov.formatter = SimpleCov::Formatter::Console
SimpleCov.start do
  add_filter "database_connection_setup.rb"
end

require File.join(File.dirname(__FILE__), '..', 'app.rb')

Capybara.app = App
end
