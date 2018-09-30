ENV['ENVIRONMENT'] = 'test'
ENV['RACK_ENV'] = 'test'
# controller
require './app/app.rb'
# models
require './app/models/peep'
require './app/models/database_connection'
# spec
require 'capybara/rspec'
require 'simplecov'
require 'simplecov-console'
# test helper
require_relative './test_helper'

Capybara.app = Chitter

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  # clearing up database before running rspec test
  config.before(:each) do
    clear_test_database
  end  

  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
